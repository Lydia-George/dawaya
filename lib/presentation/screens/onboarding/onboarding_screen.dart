import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/lists/onboard_list.dart';
import 'package:dawaya/presentation/cubits/onboarding/onboarding_cubit.dart';
import 'package:dawaya/presentation/screens/onboarding/widgets/next_skip_btn.dart';
import 'package:dawaya/presentation/screens/onboarding/widgets/onboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final obj = context.read<OnboardingCubit>();
          return Scaffold(
            backgroundColor: DColors.whiteTxt,
            body: Stack(
              children: [

                /// Horizontal Scrollable Pages
                OnboardingPages(obj: obj),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    decoration: BoxDecoration(
                      color: DColors.primaryColorBlue,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        /// Title
                        Text(
                          onboardList[state.currentIndex].title,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .apply(color: DColors.whiteTxt),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),

                        /// SubTitle
                        Text(
                          onboardList[state.currentIndex].subTitle,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: DColors.whiteTxt,
                          ),
                        ),

                        Spacer(flex: 3,),

                        /// -- DOT NAVIGATION
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            onboardList.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: state.currentIndex == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: state.currentIndex == index
                                    ? DColors.whiteTxt
                                    : DColors.dGrey1,
                                borderRadius: BorderRadiusGeometry.circular(4),
                              ),
                            ),
                          ),
                        ),

                        Spacer(),

                        /// NEXT & SKIP BUTTONS
                        NextSkipBtn(obj: obj)


                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




