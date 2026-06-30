import 'package:dawaya/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = _buildTheme(Brightness.light);
  static ThemeData darkTheme = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final backgroundColor = isDark ? DColors.dBlack : DColors.dWhite;
    final foregroundColor =isDark? DColors.dWhite : DColors.primaryColorBlue;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : DColors.dWhite;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: DColors.primaryColorBlue,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      appBarTheme: AppBarTheme(

        titleTextStyle: TextStyle(
          color:isDark ? DColors.secondaryPest : DColors.primaryColorBlue,

        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,

      ),
      colorScheme: isDark
          ? ColorScheme.dark(
              primary: DColors.primaryColorBlue,
              secondary: DColors.secondaryPest,
            )
          : ColorScheme.light(
              primary: DColors.primaryColorBlue,
              secondary: DColors.secondaryPest,
            ),

      cardTheme: CardThemeData(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        filled: true,
        fillColor: isDark ? DColors.dBlack : DColors.dWhite,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? DColors.primaryColorBlue
              : DColors.dGery2;
        }),
        trackColor: WidgetStateProperty.all(DColors.dWhite),

        trackOutlineColor: WidgetStateProperty.all(DColors.dWhite),
      ),

      focusColor: isDark ? DColors.dBlack : DColors.dWhite,
      hoverColor: isDark ? DColors.dBlack : DColors.dWhite,

        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: isDark
                ? DColors.secondaryPest
                : DColors.primaryColorBlue,
          ),

          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isDark
                ? DColors.dWhite
                : DColors.primaryColorBlue,
          ),

          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark
                ? DColors.secondaryPest
                : DColors.primaryColorBlue,
          ),

          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark
                ? DColors.dWhite
                : DColors.primaryColorBlue,
          ),

          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark
                ? DColors.dWhite
                : DColors.primaryColorBlue,
          ),

          bodyLarge: TextStyle(
            fontSize: 16,
            color: isDark
                ? DColors.dWhite
                : DColors.primaryColorBlue,
          ),

          bodyMedium: TextStyle(
            fontSize: 14,
            color: isDark
                ? DColors.dWhite
                : DColors.primaryColorBlue,
          ),

          bodySmall: TextStyle(
            fontSize: 12,
            color: isDark
                ? DColors.dGrey1
                : Colors.grey,
          ),

          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark
                ? DColors.secondaryPest
                : DColors.primaryColorBlue,
          ),

          labelSmall: TextStyle(
            fontSize: 12,
            color: isDark
                ? DColors.dGrey1
                : Colors.grey,
          ),
        ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? DColors.dBlack : DColors.dWhite,
        selectedItemColor: DColors.secondaryPest,
        unselectedItemColor: DColors.primaryColorBlue,
      )
    );
  }
}
