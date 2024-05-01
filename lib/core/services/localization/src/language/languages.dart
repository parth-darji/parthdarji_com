part of localization;

abstract class LanguageText {
  static LanguageText of(BuildContext context) {
    return Localizations.of<LanguageText>(context, LanguageText) ??
        LanguageText.of(context);
  }

  String get appName;
  String get swipeUpToOpen;
}
