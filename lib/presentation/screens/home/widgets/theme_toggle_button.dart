import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/presentation/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode =
            state.themeMode == AppThemeMode.dark ||
            (state.themeMode == AppThemeMode.system &&
                MediaQuery.platformBrightnessOf(context) == Brightness.dark);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isDarkMode ? Icons.light_mode_outlined: Icons.dark_mode_outlined ,
              color: DColors.dWhite ,
            ),
            Switch(

              hoverColor: isDarkMode ? DColors.dBlack : DColors.dWhite ,
              value: isDarkMode,
              onChanged: (value) {
                context.read<ThemeCubit>().changeTheme(
                  value ? AppThemeMode.dark : AppThemeMode.light,

                );

              },
            ),
          ],
        );
      },
    );
  }
}
