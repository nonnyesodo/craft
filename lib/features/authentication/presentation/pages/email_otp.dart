import 'package:craftman/features/authentication/presentation/pages/login_page.dart';
import 'package:craftman/features/authentication/presentation/pages/mobile_0tp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../constants/appcolors.dart';
import '../../../../constants/appscaffold.dart';
import '../../../../constants/apptext.dart';
import '../../../../constants/craftman_timer.dart';
import '../../../splash_onboarding/data/local/onboarding_images.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../src/auth_widgets_export.dart';

class EmailOtp extends StatelessWidget {
  const EmailOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuthCubit = context.watch<AuthCubit>();
    final readAuthCubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEmailVerifiedState) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const AuthAlertDialog(title: 'Created');
              });
        }
      },
      child: AppScaffold(
        isloading: watchAuthCubit.state is AuthLoadingState,
        color: Appcolors.blue,
        body: Column(children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            width: size.width,
            color: Appcolors.white,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03),
                  AppText(
                      text: 'Email Verification',
                      fontweight: FontWeight.w800,
                      color: Appcolors.blue,
                      size: 22),
                  SizedBox(height: size.height * 0.02),
                  AppText(
                      size: 16,
                      color: Appcolors.blue,
                      text:
                          'we have sent a Mail with 6digit Code to ${watchAuthCubit.emailController.text}'),
                  SizedBox(height: size.height * 0.02),
                  AppText(
                      text: 'Enter code to procced ',
                      size: 16,
                      color: Appcolors.blue),
                  SizedBox(height: size.height * 0.04),
                  CustomOtpField(controller: watchAuthCubit.otpController),
                  SizedBox(height: size.height * 0.035),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: watchAuthCubit.showTimer
                                ? () => Fluttertoast.showToast(
                                    msg: 'Please wait timer')
                                : () {
                                    readAuthCubit.changeShowTimer();
                                    readAuthCubit.resendEmailOtp();
                                  },
                            child: AppText(
                                fontweight: FontWeight.w700,
                                size: 14,
                                text: 'Resend',
                                color: Appcolors.blue)),
                        Visibility(
                          visible: watchAuthCubit.showTimer,
                          child: Row(children: [
                            AppText(
                                size: 14,
                                text: 'Expires in  ',
                                color: Appcolors.orange),
                            CraftmanTimer(
                                onEnd: () => readAuthCubit.changeShowTimer(),
                                duration: 15,
                                timerColor: Appcolors.orange)
                          ]),
                        )
                      ]),
                  SizedBox(height: size.height * 0.08),
                  AuthButton(
                      isloading: watchAuthCubit.state is AuthLoadingState,
                      width: size.width,
                      height: size.width * 0.13,
                      radius: size.width * 0.03,
                      ontap: () => readAuthCubit.verifyEmail(),
                      child: AppText(
                          text: 'Proceed',
                          color: Appcolors.white,
                          size: 20,
                          fontweight: FontWeight.w700)),
                  SizedBox(height: size.height * 0.04),
                  Image.asset(OnboardingImages.splash,
                      fit: BoxFit.contain,
                      height: size.height * 0.15,
                      width: size.width * 0.9),
                ],
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
