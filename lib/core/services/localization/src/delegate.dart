part of localization;

class AppLocalizationsDelegate extends LocalizationsDelegate<LanguageText> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
      ].contains(locale.languageCode);

  @override
  Future<LanguageText> load(Locale locale) => _load(locale);

  static Future<LanguageText> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<LanguageText> old) => false;
}
