import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<OnboardingCubit>().delaySplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorizeColors = [
      Appcolors.blue,
      Appcolors.orange,
      Appcolors.lightgrey,
      Appcolors.blue
    ];
    final colorizeTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 50.sp,
      fontFamily: 'Horizon',
    );
    final size = MediaQuery.sizeOf(context);
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.firstonboarding, (route) => false);
        }
      },
      child: AppScaffold(
          color: Appcolors.blue,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.06),
              Image.asset(
                OnboardingImages.splash,
                width: size.width * 0.9,
              ),
              AnimatedTextKit(
                pause: const Duration(seconds: 2),
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'CraftsMan',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
              ),
              // Center(
              //   child: AppText(
              //     fontweight: FontWeight.bold,
              //     size: 40,
              //     text: 'CraftsMan',
              //     color: Appcolors.lightgrey,
              //   ),
              // )
            ],
          )),
    );
  }
}
