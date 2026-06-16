import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  String btnText;

   AuthButtons({
     super.key,
    required this.btnText,
   });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: DColors.primaryColorBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DColors.blueLinear1),
        )

      ),
        onPressed: () {},
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
            color: DColors.whiteTxt,
              fontWeight: FontWeight.bold

          ),),
        ));
  }
}
