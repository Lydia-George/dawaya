import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../product_details_screen.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.widget,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Image.network(
          widget.product.image,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => Container(
            height: 220,
            color: DColors.dGery2,
            child: Icon(Icons.medication_outlined, size: 64),
          ),
        ),
      ),
    );
  }
}
