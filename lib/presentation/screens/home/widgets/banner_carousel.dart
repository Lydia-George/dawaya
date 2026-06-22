import 'package:dawaya/core/constants/image_strings.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      DImageStrings.ezabyBanner1,
      DImageStrings.tarshoubyBanner2,
      DImageStrings.seifBanner3,
      DImageStrings.drWellsBanner4,
    ];

    return SizedBox(
      height: 160,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                banners[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
