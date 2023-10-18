import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/page route/detail/route_name.dart';
import '../../../../constants/apptext.dart';
import '../../data/local/onboarding_images.dart';
import '../widgets/exports.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final readOnboardCubit = context.read<OnboardingCubit>();
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return readOnboardCubit.decreaseOnboardingindex(1);
      },
      child: AppScaffold(
          color: Appcolors.blue,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            width: size.width,
            color: Appcolors.white,
            child: Column(
              children: [
                Image.asset(
                  OnboardingImages.search,
                  height: size.height * 0.55,
                  width: size.width * 0.9,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.01),
                AppText(
                  size: 20,
                  fontweight: FontWeight.w700,
                  color: Appcolors.blue,
                  maxline: 2,
                  text:
                      'Find Service Providers Close To You On The Search Bar ',
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width,
                  child: const AppText(
                    maxline: 4,
                    text:
                        'Click the searchbar to discover the service provider that is ideal and close to you for your project!',
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                OnboardingIndicator(size: size),
                SizedBox(height: size.height * 0.025),
                OnboardButton(
                  width: size.width,
                  height: size.width * 0.13,
                  radius: size.width * 0.03,
                  ontap: () {
                    readOnboardCubit.onboardindicatindex = 0;
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteName.fourthonboarding, (route) => false);
                  },
                  child: AppText(
                    text: 'Next',
                    size: 20,
                    color: Appcolors.blue,
                    fontweight: FontWeight.w700,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
