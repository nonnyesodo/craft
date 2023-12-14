import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/exports.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final readOnboardCubit = context.read<OnboardingCubit>();
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Colors.white,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Image.asset(
                    OnboardingImages.splash,
                    height: size.height * 0.55,
                    width: size.width * 0.9,
                  ),
                  AppText(
                      maxline: 2,
                      fontweight: FontWeight.w700,
                      color: Appcolors.blue,
                      size: 20,
                      text:
                          'The One-Stop Solution For All\nYour Fixing Needs! '),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width,
                    child: const AppText(
                        maxline: 5,
                        text:
                            'Whether you need a quick fix or a major repair , we\'ve got you covered. With our service app. you can get the fix you need with just a few clicks! '),
                  ),
                  OnboardingIndicator(size: size),
                  SizedBox(height: size.height * 0.02),
                  OnboardButton(
                    height: size.width * 0.13,
                    radius: size.width * 0.03,
                    width: size.width,
                    ontap: () {
                      readOnboardCubit.increaseOnboardingindex(1);
                      Navigator.pushNamed(context, RouteName.secondonboarding);
                    },
                    child: AppText(
                      text: 'Next',
                      color: Appcolors.blue,
                      size: 20,
                      fontweight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
