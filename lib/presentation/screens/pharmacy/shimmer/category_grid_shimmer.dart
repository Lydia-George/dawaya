import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';
class CategoryGridShimmer extends StatelessWidget {
  const CategoryGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
        crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: 9,
        itemBuilder: (context , index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerBox(width: 44, height: 44,borderRadius: 8,),
                  SizedBox(height: 8,),
                  ShimmerBox(width: 60, height: 12),
                ],
              ),
            ),
          );
        });
  }
}
