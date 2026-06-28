import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = _buildTheme(Brightness.light);
  static ThemeData darkTheme = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness){
    final isDark = brightness == Brightness.dark;

    final backgroundColor = isDark ? DColors.dBlack : DColors.dWhite;
    final foregroundColor = DColors.primaryColorBlue;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : DColors.dWhite;

    return ThemeData(
      useMaterial3: true,
      brightness:brightness,
      primaryColor: DColors.primaryColorBlue,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
      ),
      colorScheme: isDark ? ColorScheme.dark(
        primary: DColors.primaryColorBlue,
        secondary: DColors.primaryColorPest
      ) : ColorScheme.light(
        primary: DColors.primaryColorBlue,
        secondary: DColors.primaryColorPest
      ) ,

      cardTheme: CardThemeData(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor:  isDark ? DColors.dBlack : DColors.dWhite,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected) ? DColors.primaryColorBlue : DColors.dGery2;
        }),
        trackColor: WidgetStateProperty.all(DColors.primaryColorBlue),


      ),

      focusColor: isDark ? DColors.dBlack : DColors.dWhite,
      hoverColor: isDark ? DColors.dBlack : DColors.dWhite,




      textTheme: TextTheme(

      ),

    );
  }




}