import 'package:dawaya/presentation/screens/products/widgets/size_options.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class SizesButtons extends StatelessWidget {
  const SizesButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 20,
      child: Column(
        children: [
          buildSizeOption('30', isSelected: true),
          SizedBox(height: DSizes.spaceBtwItems),
          buildSizeOption('60', isSelected: false),
          SizedBox(height: DSizes.spaceBtwItems),
          buildSizeOption('90', isSelected: false),
        ],
      ),
    );
  }
}
