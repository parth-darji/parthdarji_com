part of navigation;

class Navigation {
  static of(BuildContext context) {}

  static push(
    BuildContext context, {
    NamedNavigationModel? namedNavigation,
    WidgetNavigationModel? widgetNavigation,
  }) {
    assert(namedNavigation != null ? widgetNavigation == null : true);

    if (namedNavigation != null) {
      Navigator.pushNamed(
        context,
        namedNavigation.routeName,
        arguments: namedNavigation.arguments,
      );
    }

    if (widgetNavigation != null) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => widgetNavigation.screenWidget,
        ),
      );
    }
  }
}
