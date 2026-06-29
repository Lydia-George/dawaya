import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';

class SearchResultShimmer extends StatelessWidget {
  const SearchResultShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ShimmerBox(width: 50, height: 50, borderRadius: 8),
              SizedBox(width: DSizes.spaceBtwItems),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(width: 130, height: 14),
                    SizedBox(height: DSizes.spaceBtwItems),
                    ShimmerBox(width: 80, height: 11),
                  ],
                ),
              ),
              ShimmerBox(width: 50, height: 16),
            ],
          ),
        );
      },
    );
  }
}
