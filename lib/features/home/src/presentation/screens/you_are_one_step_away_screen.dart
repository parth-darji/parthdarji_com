import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';
import 'package:parthdarji_com/features/home/home.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/resources/src/colors.dart';
import '../../../../../core/widgets/widgets.dart';

class YouAreOneStepAwayScreen extends StatefulWidget {
  final HomeBloc homeBloc;

  const YouAreOneStepAwayScreen({super.key, required this.homeBloc});

  @override
  State<YouAreOneStepAwayScreen> createState() =>
      _YouAreOneStepAwayScreenState();
}

class _YouAreOneStepAwayScreenState extends State<YouAreOneStepAwayScreen> {
  double progressCount = 0;

  @override
  void initState() {
    super.initState();
    increaseProgressCount();
  }

  void increaseProgressCount() async {
    if (progressCount == 1) {
      widget.homeBloc.add(LoaderCompletedEvent());
      return;
    }

    await Future.delayed(const Duration(milliseconds: 50));

    setState(() {
      progressCount =
          double.tryParse((progressCount + 0.01).toStringAsFixed(2)) ?? 0.0;
    });

    increaseProgressCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              Animations.cubeLoader,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6.0.h),
              width: MediaQuery.of(context).size.width * 0.5,
              child: LinearProgressIndicator(
                value: progressCount,
                color: AppColors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            CommonText(
              "${(progressCount * 100).toInt()} %",
            ),
          ],
        ),
      ),
    );
  }
}
