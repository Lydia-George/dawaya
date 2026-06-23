import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/cart/cart_item_model.dart';
import 'package:dawaya/data/models/product/product_model.dart';
import 'package:dawaya/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  final String pharmacyId;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    final price = product.priceAt(pharmacyId);
    const Color pestBackGround = DColors.primaryColorPest;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [

                  /// -- BACK BUTTON
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
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
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Badge(
                            label: Text('3'),
                            child: Icon(
                              Icons.shopping_basket_outlined,
                              color: DColors.primaryColorBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// -- product Image
                  Center(child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset(product.image,
                      fit: BoxFit.contain,
                    ),
                  ),),

                  /// -- Sizes : 30 , 60, 90
                  Positioned(
                      right: 16,
                      bottom: 20,
                      child: Column(
                        children: [
                          _buildSizeOption('30', isSelected: true),
                          SizedBox(height: DSizes.spaceBtwItems,),
                          _buildSizeOption('60', isSelected: false),
                          SizedBox(height: DSizes.spaceBtwItems,),
                          _buildSizeOption('90', isSelected: false),
                        ],
                      )),
                ],
              ),
            ),

            /// -- WHITE CONTAINER
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  // product name
                  Text(
                    product.name,
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .headlineMedium!
                        .apply(color: DColors.primaryColorBlue),
                  ),
                  SizedBox(height: DSizes.sm),
                  Text(
                    product.description,
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .titleMedium!
                        .apply(color: DColors.dGrey1),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '$price EGP',
                        style: Theme
                            .of(
                          context,
                        )
                            .textTheme
                            .headlineMedium!
                            .apply(color: DColors.dGreen),
                      ),

                      // Quantity Counter
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6
                        ),
                        decoration: BoxDecoration(
                          color: DColors.primaryColorBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            /// -- Minus Button
                            _buildCounterButton(Icons.remove, () {}),
                            Padding(padding: EdgeInsets.symmetric(
                                horizontal: 16),
                              child: Text('2', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: DColors.primaryColorBlue),),
                            ),

                            /// -- Add button
                            _buildCounterButton(Icons.add, (){}),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: ()=> _handleAddToCart(context, price),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DColors.primaryColorBlue,
                        foregroundColor: DColors.whiteTxt,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.payment, size: 20,),
                          SizedBox(width: DSizes.spaceBtwItems,),
                          Text('Add to cart',
                          style: Theme.of(context).textTheme.bodyLarge,
                          )
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
        color: isSelected ? DColors.primaryColorBlue : DColors.dGrey1,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? DColors.whiteTxt : DColors.primaryColorBlue,
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
        backgroundColor: DColors.darkBlue2,
        foregroundColor: DColors.primaryColorPest,
        elevation: 0,
      ),

      child: Icon(icon, size: 16,),

    );
  }


  void _handleAddToCart(BuildContext context , dynamic price){
    final cartCubit = context.read<CartCubit>();
    final added = cartCubit.addItem(
      pharmacyId: pharmacyId,
      item: CartItemModel(
        productId: product.id,
        name: product.name,
        image: product.image,
        price: price,
      ),
    );
    if (added) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.name} added to cart')),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
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
                      pharmacyId: pharmacyId,
                      item: CartItemModel(
                        productId: product.id,
                        name: product.name,
                        image: product.image,
                        price: price,
                      ),
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${product.name} added to cart',
                        ),
                      ),
                    );
                  },
                  child: Text('Start New Order'),
                ),
              ],
            ),
      );
    }  }


}
