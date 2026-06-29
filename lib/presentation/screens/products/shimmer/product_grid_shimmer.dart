import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    /// product image
                    child: ShimmerBox(
                      width: double.infinity,
                      height: 120,
                      borderRadius: 12,
                    ),
                  ),

                  /// product name
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: ShimmerBox(width: 32, height: 32, borderRadius: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: DSizes.spaceBtwItems),

            /// Description
            ShimmerBox(width: double.infinity, height: 14),
            SizedBox(height: DSizes.spaceBtwItems),

            /// Price
            ShimmerBox(width: 100, height: 14),
          ],
        );
      },
    );
  }
}
