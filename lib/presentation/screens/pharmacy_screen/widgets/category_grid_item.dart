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

      child: Column(
        children: [
          Container(

            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadiusGeometry.circular(16),

            ),
            child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    category.icon,
                    width: 80,
                    height: 80,
                  fit: BoxFit.contain,

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

                  ),
                ),

          ),
          SizedBox(height: DSizes.spaceBtwItems),
          Text(

            category.name,
            maxLines: 2,

            overflow: TextOverflow.ellipsis,

            style: Theme.of(context).textTheme.titleSmall
            !.copyWith(fontWeight: FontWeight.w700,
              color: DColors.blueLinear1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: DSizes.spaceBtwItems,),



        ],
      ),
    );
  }


}
