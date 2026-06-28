import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/presentation/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Appearance',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),

            SizedBox(height: DSizes.spaceBtwItems),
            RadioListTile<AppThemeMode>(
              title: Text('Light'),
              secondary: Icon(Icons.light_mode_outlined),
              value: AppThemeMode.light,
              groupValue: state.themeMode,
              onChanged: (mode) {
                if (mode != null) context.read<ThemeCubit>().changeTheme(mode);
              },
            ),

            RadioListTile<AppThemeMode>(
              title: Text('Dark'),
              secondary: Icon(Icons.dark_mode_outlined),
              groupValue: state.themeMode,
              value: AppThemeMode.dark,
              onChanged: (mode) {
                if (mode != null) context.read<ThemeCubit>().changeTheme(mode);
              },
            ),

            RadioListTile<AppThemeMode>(
              title: const Text('System Default'),
              secondary: const Icon(Icons.settings_suggest_outlined),
              value: AppThemeMode.system,
              groupValue: state.themeMode,
              onChanged: (mode) {
                if (mode != null) context.read<ThemeCubit>().changeTheme(mode);
              },
            ),
          ],
        );
      },
    );
  }
}
