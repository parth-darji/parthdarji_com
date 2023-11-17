import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parthdarji_com/src/core/utils/assets.dart';
import 'package:parthdarji_com/src/core/utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, NamedRoutes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.loading,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
