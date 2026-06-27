import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: DColors.primaryColorBlue,
    scaffoldBackgroundColor: DColors.whiteTxt,
    appBarTheme: AppBarTheme(
      backgroundColor: DColors.whiteTxt,
      foregroundColor: DColors.primaryColorBlue,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: DColors.primaryColorBlue,
      secondary: DColors.primaryColorPest,
    ),

    textTheme: TextTheme(

    ),

  );


  static ThemeData darkTheme =ThemeData(
    brightness: Brightness.dark,
    primaryColor: DColors.primaryColorBlue,
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: DColors.primaryColorBlue,
      secondary: DColors.primaryColorPest,
    ),
    cardColor: const Color(0xFF1E1E1E),
    textTheme: const TextTheme(),
  );


}