import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/data/models/category/category_model.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/category_products_screen.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel category;
  final String pharmacyId;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryProductsScreen(
              categoryId: category.id,
              categoryName: category.name,
              pharmacyId: pharmacyId,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: DColors.dGery2,
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(category.image, width: 120, height: 120)),
            SizedBox(height: DSizes.spaceBtwItems),
            Text(
              category.name,
              style: Theme.of(context).textTheme.titleLarge!.apply(color: DColors.blueLinear1),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}
