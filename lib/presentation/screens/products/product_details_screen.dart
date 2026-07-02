import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/cart/cart_item_model.dart';
import 'package:dawaya/data/models/favouriteItem/favorite_item_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:dawaya/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:dawaya/presentation/screens/cart/cart_screen.dart';
import 'package:dawaya/presentation/screens/products/widgets/back_button.dart';
import 'package:dawaya/presentation/screens/products/widgets/counter_button.dart';
import 'package:dawaya/presentation/screens/products/widgets/product_image.dart';
import 'package:dawaya/presentation/screens/products/widgets/size_options.dart';
import 'package:dawaya/presentation/screens/products/widgets/sizes_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  final String pharmacyId;
  final String pharmacyName;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.pharmacyId, required this.pharmacyName,
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
    const Color pestBackground = DColors.secondaryPest;

    return Scaffold(
      backgroundColor: DColors.dWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  /// -- BACK BUTTON
                  CustomBackButton(),

                  /// -- product Image
                  ProductImage(widget: widget),

                  /// -- Sizes : 30 , 60, 90
                  SizesButtons(),
                ],
              ),
            ),

            /// -- BLUE CONTAINER
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
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, favState) {
                      final isFav = favState.isFavorite(widget.product.id);
                      return Row(
                        children: [
                          Expanded(
                            /// -- PRODUCT NAME
                            child: Text(
                              widget.product.name,
                              style: Theme.of(context).textTheme.headlineMedium!
                                  .apply(color: DColors.dWhite),
                            ),
                          ),

                          /// -- FAVORITE ICON BUTTON
                          IconButton(
                            onPressed: () {
                              context.read<FavoriteCubit>().toggleFavorites(
                                FavoriteItemModel(
                                  productId: widget.product.id,
                                  name: widget.product.name,
                                  image: widget.product.image,
                                  price: widget.product.price,
                                  pharmacyId: widget.pharmacyId,
                                  pharmacyName: widget.product.name,
                                ),
                              );
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? DColors.dRed : DColors.dWhite,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: DSizes.sm),

                  /// -- PRODUCT DESCRIPTION
                  Text(
                    widget.product.description,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.apply(color: DColors.dGery2),
                  ),
                  SizedBox(height: DSizes.spaceBtwSections),
                  /// PRICE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(widget.product.price * _quantity).toStringAsFixed(2)} EGP',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .apply(color: DColors.dWhite),
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
                              buildCounterButton(Icons.remove, _decrement),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  '$_quantity',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .apply(color: DColors.dWhite),
                                ),
                              ),

                              /// -- Add button
                              buildCounterButton(Icons.add, _increment),
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
                        backgroundColor: DColors.dWhite,
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
                  SnackBar(
                    content: Text('${widget.product.name} added to cart'),
                  ),
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



