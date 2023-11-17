import 'package:flutter/material.dart';

import '../../presentation/home/home_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  NamedRoutes.home: (context) => const HomePage(),
};

class NamedRoutes {
  static String splash = '/splash';
  static String home = '/home';
}
