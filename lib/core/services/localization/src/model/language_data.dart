part of localization;

class LanguageData {
  final String name;
  final String languageCode;

  LanguageData(this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData(languageNames.english, languageCodes.english),
      LanguageData(languageNames.hindi, languageCodes.hindi),
    ];
  }
}
