part of navigation;

class WidgetNavigationModel<T> {
  final Widget screenWidget;
  final Route<T>? customPageRoute;

  WidgetNavigationModel({
    required this.screenWidget,
    this.customPageRoute,
  });
}
