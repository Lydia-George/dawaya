import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Circular Photo
          Center(child: ShimmerBox(width: 90, height: 90, borderRadius: 45)),

          SizedBox(height: DSizes.spaceBtwItems),
          Center(child: ShimmerBox(width: 100, height: 16)),
          SizedBox(height: DSizes.spaceBtwItems),
          Center(child: ShimmerBox(width: 150, height: 12)),
          SizedBox(height: DSizes.spaceBtwSections),

          ShimmerBox(width: 140, height: 16),
          SizedBox(height: DSizes.spaceBtwItems),
          ShimmerBox(width: double.infinity, height: 60, borderRadius: 12),
        ],
      ),
    );
  }
}
