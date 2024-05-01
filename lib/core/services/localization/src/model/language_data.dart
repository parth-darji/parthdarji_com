part of localization;

class LanguageData {
  final String name;
  final String languageCode;

  LanguageData(this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData(Languages.of(LanguageConstant.name).english,
          Languages.of(LanguageConstant.code).english),
      LanguageData(Languages.of(LanguageConstant.name).hindi,
          Languages.of(LanguageConstant.code).hindi),
    ];
  }
}
