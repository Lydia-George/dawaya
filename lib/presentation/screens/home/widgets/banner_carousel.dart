import 'package:carousel_slider/carousel_slider.dart';
import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/presentation/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: banners.length,
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 0.92,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  context.read<HomeCubit>().changeBanner(index);
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    banners[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),

            SizedBox(height: DSizes.spaceBtwItems),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: state.currentBannerIndex == index ? 12 : 6,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: state.currentBannerIndex == index
                        ? DColors.primaryColorBlue
                        : DColors.dGrey1,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
