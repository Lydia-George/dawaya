import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class OrSignUpInLine extends StatelessWidget {
  const OrSignUpInLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: DColors.blueLinear1,
          ),
        ),
        SizedBox(width: 10,),
        Text(
          DText.orSignUpWith,
          style: Theme.of(context).textTheme.bodySmall!.apply(
            color: DColors.primaryColorBlue,
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: DColors.blueLinear1,
          ),
        ),
      ],
    );
  }
}
