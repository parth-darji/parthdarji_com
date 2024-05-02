part of localization;

abstract class LanguageText {
  static LanguageText of(BuildContext context) {
    return Localizations.of<LanguageText>(context, LanguageText) ??
        LanguageText.of(context);
  }

  String get appName;
  String get swipeUpToOpen;
  String get vaatoId;
  String get vaatoSignInDescription;
  String get signInTextFieldHintText;
  String get newUserRegistrationActionText;
  String get vaatoPrivacyText;
  String get continueButtonText;
}
