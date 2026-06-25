import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/data/models/category/category_model.dart';
import 'package:dawaya/presentation/screens/pharmacy_screen/category_products_screen.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel category;
  final String pharmacyId;
  static const List<Color> _palette = [
    Color(0xFFEAF3DE),
    Color(0xFFE6F1FB),
    Color(0xFFFAEEDA),
    Color(0xFFEEEDFE),
    Color(0xFFFBEAF0),
    Color(0xFFFCEBEB),
  ];

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.pharmacyId,
  });

  @override
  Widget build(BuildContext context) {
    final colorIndex = int.tryParse(category.id) ?? 0;
    final bgColor = _palette[colorIndex % _palette.length];

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
          color: bgColor,
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  category.icon,
                  width: 120,
                  height: 120,

                errorBuilder: (_,__,___) =>
                   Icon( Icons.medication_outlined, size: 32,),
                  loadingBuilder: (context, child, progress){
                    if(progress == null ) return child;
                    return SizedBox(
                      width: 44,
                      height: 44,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2,),

                      ),
                    );
                  },

                )),
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
