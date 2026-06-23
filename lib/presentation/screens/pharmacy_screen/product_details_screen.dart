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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.apply(color: DColors.primaryColorPest),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                product.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            Text(
              product.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.apply(color: DColors.primaryColorBlue),
            ),
            SizedBox(height: DSizes.sm),
            Text(
              '$price EGP',
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.apply(color: DColors.dGreen),
            ),
            SizedBox(height: DSizes.spaceBtwItems),
            Text(
              product.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: DColors.dGrey1),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
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
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
