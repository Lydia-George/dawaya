import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/cart/cart_item_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  final String pharmacyId;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.pharmacyId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;

  void _increment() => setState(() => _quantity++);

  void _decrement() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  @override
  Widget build(BuildContext context) {
    const Color pestBackGround = DColors.primaryColorPest;

    return Scaffold(
      backgroundColor: DColors.whiteTxt,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  /// -- BACK BUTTON
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: DColors.dGery2,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: DColors.primaryColorBlue,
                              size: 18,
                            ),
                          ),
                        ),

                        /// -- CART BUTTON
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            final itemsCount = state.items.length;
                            return CircleAvatar(
                              backgroundColor: DColors.dGery2,
                              child: Badge(
                                backgroundColor: DColors.primaryColorBlue,
                                label: Text('$itemsCount'),
                                isLabelVisible: itemsCount > 0,
                                child: IconButton(
                                  icon: Icon(Icons.add_shopping_cart),
                                  color: DColors.primaryColorBlue,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CartScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  /// -- product Image
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Image.network(
                        widget.product.image,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          height: 220,
                          color: DColors.dGery2,
                          child: Icon(Icons.medication_outlined, size: 64),
                        ),
                      ),
                    ),
                  ),

                  /// -- Sizes : 30 , 60, 90
                  Positioned(
                    right: 16,
                    bottom: 20,
                    child: Column(
                      children: [
                        _buildSizeOption('30', isSelected: true),
                        SizedBox(height: DSizes.spaceBtwItems),
                        _buildSizeOption('60', isSelected: false),
                        SizedBox(height: DSizes.spaceBtwItems),
                        _buildSizeOption('90', isSelected: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- WHITE CONTAINER
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: DColors.primaryColorBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.apply(color: DColors.whiteTxt),
                  ),
                  SizedBox(height: DSizes.sm),
                  Text(
                    widget.product.description,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.apply(color: DColors.dGery2),
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(widget.product.price * _quantity).toStringAsFixed(2)} EGP',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .apply(color: DColors.whiteTxt),
                      ),
                      SizedBox(width: DSizes.spaceBtwItems),

                      Flexible(
                        child: Container(
                          width: 150,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: DColors.primaryColorBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// -- Minus Button
                              _buildCounterButton(Icons.remove, _decrement),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  '$_quantity',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(color: DColors.whiteTxt),
                                ),
                              ),

                              /// -- Add button
                              _buildCounterButton(Icons.add, _increment),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),

                  /// -- ADD TO CART BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => _handleAddToCart(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DColors.whiteTxt,
                        foregroundColor: DColors.primaryColorBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart, size: 20),
                          SizedBox(width: DSizes.spaceBtwItems),
                          Text(
                            'Add to cart',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: DColors.primaryColorBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeOption(String text, {required bool isSelected}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? DColors.whiteTxt : DColors.primaryColorBlue,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? DColors.primaryColorBlue : DColors.whiteTxt,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.zero,
        minimumSize: Size(28, 28),
        backgroundColor: DColors.whiteTxt,
        foregroundColor: DColors.primaryColorBlue,
        elevation: 0,
      ),
      child: Icon(icon, size: 16),
    );
  }

  void _handleAddToCart(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final added = cartCubit.addItem(
      pharmacyId: widget.pharmacyId,
      item: CartItemModel(
        productId: widget.product.id,
        name: widget.product.name,
        image: widget.product.image,
        price: widget.product.price,
        quantity: _quantity,
      ),
    );
    if (added) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.product.name} added to cart')),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Do you Want to start new order ?'),
          content: Text(
            'Your cart contains items from a different pharmacy. Adding this item will clear your current cart.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                cartCubit.clearAndAddItem(
                  pharmacyId: widget.pharmacyId,
                  item: CartItemModel(
                    productId: widget.product.id,
                    name: widget.product.name,
                    image: widget.product.image,
                    price: widget.product.price,
                    quantity: _quantity,
                  ),
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${widget.product.name} added to cart')),
                );
              },
              child: Text('Start New Order'),
            ),
          ],
        ),
      );
    }
  }
}