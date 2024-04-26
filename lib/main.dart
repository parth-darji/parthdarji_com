import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parthdarji_com/core/resources/resources.dart';
import 'package:parthdarji_com/features/splash/splash.dart';

import 'core/init/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInit.initialize();
  await SupabaseInit.initialize();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'parthdarji.com',
      theme: const CupertinoThemeData(),
      home: const SplashScreen(),
      initialRoute: Routes.splash,
      routes: routes,
    );
  }
}
