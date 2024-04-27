part of localization;

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages) ??
        Languages.of(context);
  }

  String get appName;
  String get swipeUpToOpen;
}
