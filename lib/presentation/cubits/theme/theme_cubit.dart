import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState()) {}

  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMode = prefs.getString('theme_mode');

    if (savedMode != null) {
      final mode = AppThemeMode.values.firstWhere(
        (e) => e.toString() == savedMode,
        orElse: () => AppThemeMode.system,
      );
      emit(state.copyWith(themeMode: mode));
    }
  }



  Future<void> changeTheme(AppThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', mode.toString());

  }
}
