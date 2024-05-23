import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parthdarji_com/core/services/responsive/responsive.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/localization/localization.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Images.vaatoTransparentLogo,
              height: 100.0.h,
            ),
            CommonText(
              LanguageText.of(context).vaatoId,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
                left: 40.0.w,
                right: 40.0.w,
              ),
              child: CommonText(
                LanguageText.of(context).vaatoSignInDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0.sp,
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
                placeholder: LanguageText.of(context).emailHintText,
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
                top: 4.0.h,
                left: 50.0.w,
                right: 50.0.w,
              ),
              child: CupertinoButton(
                onPressed: () {},
                child: CommonText(
                  LanguageText.of(context).newUserRegistrationActionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.handshake,
              size: 30.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
                left: 20.0.w,
                right: 20.0.w,
              ),
              child: CommonText(
                LanguageText.of(context).vaatoPrivacyText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0.sp,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
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
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => const PasswordScreen(),
                    );

                    // Traveller.go(
                    //   context,
                    //   namedTravelling: NamedTravelling(
                    //     destinationName: Routes.password,
                    //   ),
                    // );
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
