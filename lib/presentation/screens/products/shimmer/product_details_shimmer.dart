import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- PRODUCT IMAGE
          Expanded(
            child: Center(
              child: ShimmerBox(width: 220, height: 220, borderRadius: 16),
            ),
          ),

          /// -- ROUNDED BOTTOM CONTAINER
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                ShimmerBox(width: double.infinity, height: 22),
                SizedBox(height: DSizes.spaceBtwItems),
                ShimmerBox(width: 200, height: 14),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBox(width: 80, height: 24),
                    ShimmerBox(width: 100, height: 50, borderRadius: 25),
                  ],
                ),
                SizedBox(height: DSizes.spaceBtwSections),
                ShimmerBox(
                  width: double.infinity,
                  height: 55,
                  borderRadius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
