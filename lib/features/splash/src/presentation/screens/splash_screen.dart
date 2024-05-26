import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/traveller/traveller.dart';
import '../../../../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
    ).then((value) {
      Traveller.go(
        context,
        widgetTravelling: WidgetTravelling(
          widget: const HelloScreen(),
          customPageRoute: PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (_, __, ___) => const HelloScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double min = 0.8;
    double max = 1.2;

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 110.0.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    assets.images.appLogo,
                  ),
                ),
              ).animate(
                effects: [
                  ScaleEffect(
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 1),
                    begin: Offset(max, max),
                    end: Offset(min, min),
                  ),
                ],
              ).animate(
                effects: [
                  ScaleEffect(
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 1),
                    begin: Offset(min, min),
                    end: Offset(max, max),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 60.0.h,
            //   child: Lottie.asset(
            //     Animations.waitingSandBlue,
            //     height: 70.0.h,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
