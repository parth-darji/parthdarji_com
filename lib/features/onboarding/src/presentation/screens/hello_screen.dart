import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/resources/src/colors.dart';
import '../../../../../core/services/localization/localization.dart';
import '../../../../../core/services/traveller/traveller.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../onboarding.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );
    Future.delayed(
      const Duration(milliseconds: 500),
    ).then((value) {
      animationController.forward();
      animationController.repeat();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            if ((details.primaryVelocity ?? 0) < 0) {
              Traveller.go(
                context,
                widgetTravelling: WidgetTravelling(
                  widget: const LanguageSelectionScreen(),
                  customPageRoute: PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LanguageSelectionScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                ),
              );
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      assets.images.seaBreezeWallpaper,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.1),
                      child: Lottie.asset(
                        Animations.helloIphone,
                        height: 300,
                        filterQuality: FilterQuality.high,
                        controller: animationController,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 32.0.h,
                child: CommonText(
                  LanguageText.of(context).swipeUpToOpen,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.white,
                        fontSize: 14.0.sp,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
