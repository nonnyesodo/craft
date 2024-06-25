import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/material.dart';

import '../widgets/exports.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          color: Colors.white,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              Image.asset(OnboardingImages.splash,
                  fit: BoxFit.contain,
                  height: size.height * 0.55,
                  width: size.width * 0.9),
              SizedBox(height: size.height * 0.01),
              AppText(
                  maxline: 2,
                  fontweight: FontWeight.w700,
                  color: Appcolors.blue,
                  size: 20,
                  text: 'The One-Stop Solution For All\nYour Fixing Needs! '),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                  width: size.width,
                  child: const AppText(
                      maxline: 5,
                      text:
                          'Whether you need a quick fix or a major repair , we\'ve got you covered. With our service app. you can get the fix you need with just a few clicks! ')),
              SizedBox(height: size.height * 0.035),
              OnboardButton(
                ontap: () =>
                    Navigator.pushNamed(context, RouteName.secondonboarding),
              ),
            ],
          ),
        ));
  }
}
