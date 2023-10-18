import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/presentation/widgets/exports.dart';
import 'package:flutter/material.dart';

import '../../data/local/onboarding_Images.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Appcolors.white,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Center(
                    child: AppText(
                        textalign: TextAlign.center,
                        maxline: 2,
                        size: 25,
                        color: Appcolors.blue,
                        fontweight: FontWeight.w700,
                        text: 'Finding Service Providers has never been easy'),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.7,
                    child: AppText(
                        fontweight: FontWeight.w500,
                        color: Appcolors.blue,
                        textalign: TextAlign.center,
                        text:
                            'Save time by getting home appliance fix in one place '),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Image.asset(
                    OnboardingImages.splash,
                    height: size.height * 0.5,
                    width: size.width * 0.9,
                  ),
                  SizedBox(height: size.height * 0.1),
                  OnboardButton(
                      buttoncolor: Appcolors.blue,
                      width: size.width,
                      height: size.width * 0.13,
                      radius: size.width * 0.03,
                      ontap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteName.login, (route) => false);
                      },
                      child: AppText(
                        text: 'Get Started',
                        fontweight: FontWeight.w700,
                        color: Appcolors.white,
                        size: 20,
                      )),
                ],
              ),
            )),
          ],
        ));
  }
}
