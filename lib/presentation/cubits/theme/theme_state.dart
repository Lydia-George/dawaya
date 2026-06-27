part of 'theme_cubit.dart';



enum AppThemeMode{light, dark, system}

 class ThemeState {
  final AppThemeMode themeMode;

  ThemeState({this.themeMode = AppThemeMode.system});

  ThemeState copyWith({AppThemeMode? themeMode}){
    return ThemeState(
      themeMode: themeMode ?? this.themeMode
    );
}

ThemeMode get flutterThemeMode{
    switch (themeMode){
      case AppThemeMode.light :
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;

    }
}




 }

