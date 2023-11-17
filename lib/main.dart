import 'package:flutter/material.dart';

import 'src/core/utils/routes.dart';
import 'src/presentation/home/home_page.dart';

void main() {
  runApp(const MySite());
}

class MySite extends StatelessWidget {
  const MySite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'parthdarji.com',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      initialRoute: NamedRoutes.splash,
      routes: routes,
    );
  }
}
