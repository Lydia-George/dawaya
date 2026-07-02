
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

Widget buildSizeOption(String text, {required bool isSelected}) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: isSelected ? DColors.dWhite : DColors.primaryColorBlue,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? DColors.primaryColorBlue : DColors.dWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}