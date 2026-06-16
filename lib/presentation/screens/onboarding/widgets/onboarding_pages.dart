import 'package:dawaya/lists/onboard_list.dart';
import 'package:dawaya/presentation/cubits/onboarding/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({
    super.key,
    required this.obj,
  });

  final OnboardingCubit obj;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView.builder(
        controller: obj.pageController,
        onPageChanged: obj.onPageChanged,
        itemCount: onboardList.length,
        itemBuilder: (context, index) {
          return Image.asset(
            onboardList[index].imageUrl,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}