import 'package:dawaya/core/shimmers/shimmer_box.dart';
import 'package:flutter/material.dart';
class PharmacyCardShimmer extends StatelessWidget {
  const PharmacyCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200
        ),
        borderRadius: BorderRadius.circular(14),

      ),

      child: Row(
        children: [
          ShimmerBox(width: 56, height: 56, borderRadius: 10,),
          SizedBox(width: 12,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(width: 120, height: 14),
                  SizedBox(height: 8,),
                  ShimmerBox(width: 180, height: 12),
                  SizedBox(height: 8,),
                  ShimmerBox(width: 90, height: 12),
                ],
              ))
        ],
      ),
    );
  }
}
