import 'package:flutter/material.dart';

import '../localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<LanguageText> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        Languages.of(LanguageConstant.code).english,
      ].contains(locale.languageCode);

  @override
  Future<LanguageText> load(Locale locale) => _load(locale);

  static Future<LanguageText> _load(Locale locale) async {
    if (locale.languageCode == Languages.of(LanguageConstant.code).english) {
      return LanguageEn();
    } else {
      return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<LanguageText> old) => false;
}
