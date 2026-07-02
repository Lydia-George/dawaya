import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

Widget buildCounterButton(IconData icon, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      padding: EdgeInsets.zero,
      minimumSize: Size(28, 28),
      backgroundColor: DColors.dWhite,
      foregroundColor: DColors.primaryColorBlue,
      elevation: 0,
    ),
    child: Icon(icon, size: 16),
  );
}
