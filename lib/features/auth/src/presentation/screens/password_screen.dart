import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/localization/localization.dart';
import '../../../../../core/services/traveller/traveller.dart';
import '../../../../../core/widgets/widgets.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.lock_circle_fill,
              size: 60.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
                left: 80.0.w,
                right: 80.0.w,
              ),
              child: CommonText(
                LanguageText.of(context).vaatoIdPassword,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 17.0.h,
                left: 20.0.w,
                right: 20.0.w,
              ),
              child: CupertinoTextField(
                controller: TextEditingController(),
                placeholder: LanguageText.of(context).passwordHintText,
                placeholderStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.placeholderText,
                ),
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                padding: EdgeInsets.symmetric(
                  vertical: 17.0.h,
                  horizontal: 13.0.w,
                ),
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide.none,
                  ),
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 17.0.h,
                left: 20.0.w,
                right: 20.0.w,
              ),
              child: CupertinoTextField(
                controller: TextEditingController(),
                placeholder: LanguageText.of(context).verifyPasswordHintText,
                placeholderStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.placeholderText,
                ),
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                padding: EdgeInsets.symmetric(
                  vertical: 17.0.h,
                  horizontal: 13.0.w,
                ),
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide.none,
                  ),
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
                left: 20.0.w,
                right: 20.0.w,
              ),
              child: CommonText(
                LanguageText.of(context).passwordTextFieldInstruction,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0.sp,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0.h,
                left: 20.0.w,
                right: 20.0.w,
              ),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: () {
                    Traveller.go(
                      context,
                      namedTravelling: NamedTravelling(
                        destinationName: Routes.youAreOneStepAway,
                      ),
                    );
                  },
                  child: CommonText(
                    LanguageText.of(context).continueButtonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
