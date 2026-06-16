import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/onboarding/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextSkipBtn extends StatelessWidget {
  const NextSkipBtn({
    super.key,
    required this.obj,
  });

  final OnboardingCubit obj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Skip
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          child: Text(DText.skip, style: TextStyle(
            color: DColors.whiteTxt,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),),

        ElevatedButton(
            onPressed: (){
              if(obj.isLastPage){
                Navigator.pushReplacementNamed(context, '/login');
              }else{
                obj.nextPage();
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: DColors.whiteTxt,
                foregroundColor: DColors.primaryColorPest,
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(50),
                )
            ),

            child: Text(obj.isLastPage? 'Get Started' : 'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ))

      ],
    );
  }
}