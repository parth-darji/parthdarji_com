import 'package:flutter/cupertino.dart';

import '../traveller.dart';

class Traveller<T> {
  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<dynamic> go(
    BuildContext context, {
    NamedTravelling? namedTravelling,
    WidgetTravelling? widgetTravelling,
  }) async {
    assert(namedTravelling != null ? widgetTravelling == null : true);
    assert(namedTravelling == null ? widgetTravelling != null : true);
    assert(!(namedTravelling == null && widgetTravelling == null));

    dynamic result;

    if (namedTravelling != null) {
      result = await Navigator.pushNamed(
        context,
        namedTravelling.destinationName,
        arguments: namedTravelling.luggage,
      );
    }

    if (widgetTravelling != null) {
      if (context.mounted) {
        result = await Navigator.push(
          context,
          widgetTravelling.customPageRoute != null
              ? widgetTravelling.customPageRoute!
              : CupertinoPageRoute(
                  builder: (context) => widgetTravelling.widget,
                ),
        );
      }
    }

    return result;
  }

  static Future<dynamic> goAndForgotPreviousTrip(
    BuildContext context, {
    NamedTravelling? namedTravelling,
    WidgetTravelling? widgetTravelling,
  }) async {
    assert(namedTravelling != null ? widgetTravelling == null : true);
    assert(namedTravelling == null ? widgetTravelling != null : true);
    assert(!(namedTravelling == null && widgetTravelling == null));

    dynamic result;

    if (namedTravelling != null) {
      result = await Navigator.pushReplacementNamed(
        context,
        namedTravelling.destinationName,
        arguments: namedTravelling.luggage,
      );
    }

    if (widgetTravelling != null) {
      if (context.mounted) {
        result = await Navigator.pushReplacement(
          context,
          widgetTravelling.customPageRoute != null
              ? widgetTravelling.customPageRoute!
              : CupertinoPageRoute(
                  builder: (context) => widgetTravelling.widget,
                ),
        );
      }
    }

    return result;
  }

  static goAndForgotAllTrips(
    BuildContext context, {
    NamedTravelling? namedTravelling,
    WidgetTravelling? widgetTravelling,
  }) {
    assert(namedTravelling != null ? widgetTravelling == null : true);
    assert(namedTravelling == null ? widgetTravelling != null : true);
    assert(!(namedTravelling == null && widgetTravelling == null));

    if (namedTravelling != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        namedTravelling.destinationName,
        arguments: namedTravelling.luggage,
        (route) => false,
      );
    }

    if (widgetTravelling != null) {
      Navigator.pushAndRemoveUntil(
        context,
        widgetTravelling.customPageRoute != null
            ? widgetTravelling.customPageRoute!
            : CupertinoPageRoute(
                builder: (context) => widgetTravelling.widget,
              ),
        (route) => false,
      );
    }
  }
}
