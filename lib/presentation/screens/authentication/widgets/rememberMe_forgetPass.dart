import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgetPass extends StatelessWidget {
  const RememberMeAndForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: true,
            activeColor: DColors.primaryColorPest,
            onChanged: (value) {}),
        Text(DText.rememberMe, style: TextStyle(
            color: DColors.primaryColorBlue
        ),),
        Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(DText.forgetPassword,
              style: TextStyle(
                  color: DColors.primaryColorBlue
              ),
            )),
      ],
    );
  }
}