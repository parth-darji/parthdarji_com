part of localization;

abstract class LanguageText {
  static LanguageText of(BuildContext context) {
    return Localizations.of<LanguageText>(context, LanguageText) ??
        LanguageText.of(context);
  }

  String get appName;
  String get swipeUpToOpen;
  String get vaatoId;
  String get vaatoIdPassword;
  String get vaatoSignInDescription;
  String get emailHintText;
  String get passwordHintText;
  String get passwordTextFieldInstruction;
  String get verifyPasswordHintText;
  String get newUserRegistrationActionText;
  String get vaatoPrivacyText;
  String get continueButtonText;
  String get settingUpYourAccount;
}
