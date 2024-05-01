part of localization;

LanguageCode languageCodes = LanguageCode();
LanguageName languageNames = LanguageName();

abstract class Languages {
  String english = "";
  String hindi = "";
}

class LanguageCode implements Languages {
  @override
  String english = "en";

  @override
  String hindi = "hi";
}

class LanguageName implements Languages {
  @override
  String english = "English";

  @override
  String hindi = "Hindi";
}
