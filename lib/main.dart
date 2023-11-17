import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/core/utils/routes.dart';
import 'src/presentation/home/home_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MySite());
}

class MySite extends StatelessWidget {
  const MySite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parth Darji - Software Engineer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
      initialRoute: NamedRoutes.splash,
      routes: routes,
    );
  }
}
