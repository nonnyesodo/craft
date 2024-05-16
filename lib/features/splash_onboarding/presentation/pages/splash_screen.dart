import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:craftman/features/splash_onboarding/data/local/onboarding_images.dart';
import 'package:craftman/features/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../authentication/presentation/pages/login_page.dart';
import '../../../booking/presentation/bloc/cubit/booking_cubit.dart';
import '../../../home/presentation/bloc/cubit/home_cubit.dart';

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
    final readHome = context.read<HomeCubit>();
    final colorizeColors = [
      Appcolors.blue,
      Appcolors.orange,
      Appcolors.lightgrey,
      Appcolors.blue
    ];
    final colorizeTextStyle = TextStyle(
        fontWeight: FontWeight.w700, fontSize: 50.sp, fontFamily: 'Horizon');
    final size = MediaQuery.sizeOf(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
          if (state is OnboardingLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.login, (route) => false);
          }
          if (state is Newuserstate) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.firstonboarding, (route) => false);
          }
          if (state is AutoLoginState) {
            context.read<AuthCubit>().login();
          }
        }),
        BlocListener<AuthCubit, AuthState>(listener: (context, state) {
          if (state is LoginState) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.bottomNav, (route) => false);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const AuthAlertDialog(title: 'Logged In');
                });
            readHome.getCategories();

            readHome.getPopularService();
            readHome.getNotification();
            context.read<BookingCubit>().getbookingHistory();
          }
          if (state is AuthErrorState) {
            Navigator.pushNamed(context, RouteName.login);
          }
        })
      ],
      child: AppScaffold(
          color: Appcolors.blue,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.06),
              Image.asset(OnboardingImages.splash, width: size.width * 0.9),
              AnimatedTextKit(
                  pause: const Duration(seconds: 2),
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'CraftsMan',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    )
                  ],
                  isRepeatingAnimation: true),
              // context.watch<AuthCubit>().state is AuthLoadingState
              //     ? Column(
              //         children: [
              //           LoadingAnimationWidget.inkDrop(
              //               color: Appcolors.white, size: 25.sp),
              //           SizedBox(height: size.height * 0.013),
              //           AppText(
              //               text: 'Please wait ..',
              //               color: Appcolors.white,
              //               size: 16)
              //         ],
              //       )
              //     : const SizedBox.shrink()
            ],
          )),
    );
  }
}
