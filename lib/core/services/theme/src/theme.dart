import 'package:flutter/cupertino.dart';

import '../theme.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();

  CupertinoThemeData get lightTheme => lightThemeInstance;
  CupertinoThemeData get darkTheme => darkThemeInstance;
}
