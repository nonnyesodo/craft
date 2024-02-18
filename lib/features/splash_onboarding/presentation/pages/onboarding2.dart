import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/material.dart';

import '../widgets/exports.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppScaffold(
        color: Appcolors.blue,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          width: size.width,
          color: Appcolors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              Image.asset(OnboardingImages.review,
                  height: size.height * 0.55,
                  width: size.width * 0.9,
                  fit: BoxFit.cover),
              SizedBox(height: size.height * 0.013),
              AppText(
                  text: 'Reviews And Feedback',
                  size: 20,
                  color: Appcolors.blue,
                  fontweight: FontWeight.w700),
              SizedBox(height: size.height * 0.036),
              SizedBox(
                  width: size.width,
                  child: const AppText(
                      maxline: 5,
                      text:
                          'see reviews and feedbacks from other users,to get a sense of how our service providers have helped them and what you can expect from contacting them')),
              SizedBox(height: size.height * 0.035),
              OnboardButton(
                ontap: () =>
                    Navigator.pushNamed(context, RouteName.thirdonboarding),
              )
            ],
          ),
        ));
  }
}
