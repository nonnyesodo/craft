import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../constants/appcolors.dart';
import '../../../../constants/appscaffold.dart';
import '../../../../constants/apptext.dart';
import '../../../splash_onboarding/data/local/onboarding_images.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../widget/export.dart';

class MobileOtp extends StatelessWidget {
  const MobileOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuthCubit = context.watch<AuthCubit>();
    return AppScaffold(
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
                // SizedBox(height: size.height * 0.07),
                AppText(
                    text: 'Verify Mobile Number',
                    fontweight: FontWeight.w800,
                    color: Appcolors.blue,
                    size: 25),
                SizedBox(height: size.height * 0.04),
                AppText(
                    text:
                        'we have sent a 6digit otp to ${watchAuthCubit.countrycode} ${watchAuthCubit.phoneController.text}'),
                SizedBox(height: size.height * 0.025),
                PinCodeTextField(
                  pinTheme: PinTheme(
                      activeColor: Appcolors.orange,
                      inactiveColor: Appcolors.lightgrey,
                      selectedColor: Appcolors.blue,
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                      shape: PinCodeFieldShape.box,
                      fieldHeight: size.height * 0.07,
                      fieldWidth: size.height * 0.07),
                  appContext: context,
                  length: 6,
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      fontweight: FontWeight.w700,
                      size: 14,
                      text: 'Resend',
                      color: Appcolors.blue,
                    ),
                    AppText(
                      size: 14,
                      text: 'Expires In 00:23',
                      color: Appcolors.orange,
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                AuthButton(
                  isloading: watchAuthCubit.state is AuthLoadingState,
                  width: size.width,
                  height: size.width * 0.13,
                  radius: size.width * 0.03,
                  ontap: () {
                    Navigator.pushNamed(context, RouteName.bottomNav);
                  },
                  child: AppText(
                    text: 'Confirm',
                    color: Appcolors.blue,
                    fontweight: FontWeight.w700,
                    size: 20,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(height: size.height * 0.02),
                Image.asset(
                  OnboardingImages.splash,
                  height: size.height * 0.15,
                  width: size.width * 0.9,
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }
}
