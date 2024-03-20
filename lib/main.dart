import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parthdarji_com/core/resources/resources.dart';
import 'package:parthdarji_com/features/auth/auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parth Darji - Software Engineer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      initialRoute: Routes.login,
      routes: routes,
    );
  }
}
