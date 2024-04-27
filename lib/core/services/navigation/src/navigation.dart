part of navigation;

class Navigation<T> {
  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<dynamic> push(
    BuildContext context, {
    NamedNavigationModel? namedNavigation,
    WidgetNavigationModel? widgetNavigation,
  }) async {
    assert(namedNavigation != null ? widgetNavigation == null : true);
    assert(namedNavigation == null ? widgetNavigation != null : true);
    assert(!(namedNavigation == null && widgetNavigation == null));

    dynamic result;

    if (namedNavigation != null) {
      result = await Navigator.pushNamed(
        context,
        namedNavigation.routeName,
        arguments: namedNavigation.arguments,
      );
    }

    if (widgetNavigation != null) {
      if (context.mounted) {
        result = await Navigator.push(
          context,
          widgetNavigation.customPageRoute != null
              ? widgetNavigation.customPageRoute!
              : CupertinoPageRoute(
                  builder: (context) => widgetNavigation.screenWidget,
                ),
        );
      }
    }

    return result;
  }

  static Future<dynamic> replaceWith(
    BuildContext context, {
    NamedNavigationModel? namedNavigation,
    WidgetNavigationModel? widgetNavigation,
  }) async {
    assert(namedNavigation != null ? widgetNavigation == null : true);
    assert(namedNavigation == null ? widgetNavigation != null : true);
    assert(!(namedNavigation == null && widgetNavigation == null));

    dynamic result;

    if (namedNavigation != null) {
      result = await Navigator.pushReplacementNamed(
        context,
        namedNavigation.routeName,
        arguments: namedNavigation.arguments,
      );
    }

    if (widgetNavigation != null) {
      if (context.mounted) {
        result = await Navigator.pushReplacement(
          context,
          widgetNavigation.customPageRoute != null
              ? widgetNavigation.customPageRoute!
              : CupertinoPageRoute(
                  builder: (context) => widgetNavigation.screenWidget,
                ),
        );
      }
    }

    return result;
  }

  static pushAndRemoveAllRoutes(
    BuildContext context, {
    NamedNavigationModel? namedNavigation,
    WidgetNavigationModel? widgetNavigation,
  }) {
    assert(namedNavigation != null ? widgetNavigation == null : true);
    assert(namedNavigation == null ? widgetNavigation != null : true);
    assert(!(namedNavigation == null && widgetNavigation == null));

    if (namedNavigation != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        namedNavigation.routeName,
        arguments: namedNavigation.arguments,
        (route) => false,
      );
    }

    if (widgetNavigation != null) {
      Navigator.pushAndRemoveUntil(
        context,
        widgetNavigation.customPageRoute != null
            ? widgetNavigation.customPageRoute!
            : CupertinoPageRoute(
                builder: (context) => widgetNavigation.screenWidget,
              ),
        (route) => false,
      );
    }
  }
}
