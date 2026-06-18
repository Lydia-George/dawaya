import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/screens/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(DText.dontHaveAcc, style: TextStyle(color: DColors.dGrey1)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (s) => SignUpScreen()),
            );
          },
          child: Text(
            DText.signUp,
            style: TextStyle(color: DColors.primaryColorBlue),
          ),
        ),
      ],
    );
  }
}
