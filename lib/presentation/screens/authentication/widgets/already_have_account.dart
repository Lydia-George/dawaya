import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(DText.alreadyHaveAcc, style: TextStyle(color: DColors.dGrey1)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (l) => LoginScreen()),
            );
          },
          child: Text(
            DText.signIn,
            style: TextStyle(color: DColors.primaryColorBlue),
          ),
        ),
      ],
    );
  }
}
