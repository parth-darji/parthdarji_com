enum LanguageConstant { code, name }

abstract class Languages {
  static Languages of(LanguageConstant constant) {
    switch (constant) {
      case LanguageConstant.code:
        return LanguageCode();
      case LanguageConstant.name:
        return LanguageName();
      default:
        return LanguageCode();
    }
  }

  String get english;
  String get hindi;
}

class LanguageCode implements Languages {
  @override
  String get english => "en";

  @override
  String get hindi => "hi";
}

class LanguageName implements Languages {
  @override
  String get english => "English";

  @override
  String get hindi => "Hindi";
}
