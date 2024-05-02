part of theme;

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();

  CupertinoThemeData get lightTheme => _lightTheme;
  CupertinoThemeData get darkTheme => _darkTheme;
}
