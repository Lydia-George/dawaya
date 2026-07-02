import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/favouriteItem/favorite_item_model.dart';
import '../../../../data/models/product/product_model.dart';
import '../../products/product_details_screen.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key, required this.item});

  final FavoriteItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final product = ProductModel(
          id: item.productId,
          name: item.name,
          categoryId: '',
          description: '',
          image: item.image,
          price: item.price,
          isAvailable: true,
          categoryName: '',
          stock: 1,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
              pharmacyId: item.pharmacyId,
              pharmacyName: item.pharmacyName,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: DColors.secondaryPest),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.image,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(Icons.medication_outlined),
              ),
            ),

            /// -- product & pharmacy name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name),
                  SizedBox(height: DSizes.spaceBtwItems),
                  Text(
                    item.pharmacyName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${item.price} EGP',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () =>
                      context.read<FavoriteCubit>().toggleFavorites(item),
                  icon: Icon(Icons.favorite, color: DColors.dRed, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
