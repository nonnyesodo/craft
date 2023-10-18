import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:craftman/config/page%20route/detail/route_name.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../splash_onboarding/data/local/onboarding_Images.dart';
import '../widget/export.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final readAuthCubit = context.read<AuthCubit>();
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
                SizedBox(height: size.height * 0.02),
                AppText(
                  text: 'Signup',
                  fontweight: FontWeight.w800,
                  color: Appcolors.blue,
                  size: 30,
                ),
                SizedBox(height: size.height * 0.06),
                AuthTextfield(
                  controller: watchAuthCubit.fullnameController,
                  validator: (value) {
                    return null;
                  },
                  prefixicon: Icon(
                    Icons.person_outline,
                    size: 25.sp,
                  ),
                  hintext: 'Fullname',
                ),
                SizedBox(height: size.height * 0.025),
                AuthTextfield(
                  controller: watchAuthCubit.emailController,
                  keyboardtype: TextInputType.emailAddress,
                  validator: (value) {
                    return null;
                  },
                  prefixicon: Icon(
                    Icons.email_outlined,
                    size: 25.sp,
                  ),
                  hintext: 'Email',
                ),
                SizedBox(height: size.height * 0.025),
                AuthTextfield(
                  controller: watchAuthCubit.phoneController,
                  validator: (value) {
                    return null;
                  },
                  keyboardtype: TextInputType.phone,
                  prefixicon: SizedBox(
                    width: size.width * 0.28,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: Icon(
                            Icons.phone_android_outlined,
                            size: 25.sp,
                          ),
                        ),
                        CountryCodePicker(
                          onChanged: (value) {
                            watchAuthCubit.countrycode = value.toString();
                            log(watchAuthCubit.countrycode);
                            log(watchAuthCubit.passwordController.text
                                .toString());
                          },
                          padding: EdgeInsets.zero,
                          showFlag: false,
                          initialSelection: 'NG',
                          favorite: const ['NG'],
                        )
                      ],
                    ),
                  ),
                  hintext: 'Mobile Number',
                ),
                SizedBox(height: size.height * 0.025),
                AuthTextfield(
                  controller: watchAuthCubit.passwordController,
                  obscure: watchAuthCubit.showPassword,
                  validator: (value) {
                    return null;
                  },
                  suffixicon: InkWell(
                    onTap: () {
                      readAuthCubit.changeShowpassword();
                    },
                    child: Icon(
                      watchAuthCubit.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 22.sp,
                    ),
                  ),
                  prefixicon: Icon(
                    Icons.lock_outline,
                    size: 25.sp,
                  ),
                  hintext: 'Password',
                ),
                SizedBox(height: size.height * 0.025),
                Terms(
                  ontap: () {
                    readAuthCubit.changeAgreetoterms();
                  },
                  size: size,
                  title:
                      'Agree to our terms of service & privacy policy guidline',
                  status: watchAuthCubit.agreetoterms,
                ),
                SizedBox(height: size.height * 0.04),
                AuthButton(
                  isloading: watchAuthCubit.state is AuthLoadingState,
                  width: size.width,
                  height: size.width * 0.13,
                  radius: size.width * 0.03,
                  ontap: () {
                    Navigator.pushNamed(context, RouteName.mobileOtp);
                  },
                  child: AppText(
                    text: 'Signup',
                    color: Appcolors.blue,
                    fontweight: FontWeight.w700,
                    size: 20,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SignupOrLogin(
                  ontap: () {
                    Navigator.pushNamed(context, RouteName.login);
                  },
                  subTitle: 'Login',
                  title: 'Already have an account?',
                ),
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
