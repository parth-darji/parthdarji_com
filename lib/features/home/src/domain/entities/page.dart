import 'app.dart';

class DrawerPage {
  final int number;
  final List<App> apps;
  bool isSelected;

  DrawerPage({
    required this.number,
    required this.apps,
    this.isSelected = false,
  });
}
