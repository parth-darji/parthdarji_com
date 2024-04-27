part of navigation;

class Navigation {
  static of(BuildContext context) {}

  static push(
    BuildContext context, {
    NamedNavigationModel? namedNavigation,
    WidgetNavigationModel? widgetNavigation,
  }) {
    assert(namedNavigation != null ? widgetNavigation == null : true);
    assert(namedNavigation == null ? widgetNavigation != null : true);
    assert(!(namedNavigation == null && widgetNavigation == null));

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
        widgetNavigation.customPageRoute != null
            ? widgetNavigation.customPageRoute!
            : CupertinoPageRoute(
                builder: (context) => widgetNavigation.screenWidget,
              ),
      );
    }
  }
}
