part of navigation;

class NamedNavigationModel {
  final String routeName;
  final Object? arguments;

  NamedNavigationModel({
    required this.routeName,
    this.arguments,
  });
}
