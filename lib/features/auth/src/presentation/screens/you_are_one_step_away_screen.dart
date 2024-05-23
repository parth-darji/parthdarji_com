import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/traveller/traveller.dart';
import '../../../../../core/widgets/widgets.dart';

class YouAreOneStepAwayScreen extends StatefulWidget {
  const YouAreOneStepAwayScreen({super.key});

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
      Traveller.goAndForgotAllTrips(
        context,
        namedTravelling: NamedTravelling(
          destinationName: Routes.home,
        ),
      );

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
    return CupertinoPageScaffold(
      child: Center(
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
