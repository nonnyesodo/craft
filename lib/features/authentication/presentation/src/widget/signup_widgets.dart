import 'package:craftman/features/authentication/data/local/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../constants/export.dart';
import '../../bloc/cubit/auth_cubit.dart';
import '../auth_widgets_export.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key, this.formKey});
  final formKey;

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    final size = MediaQuery.sizeOf(context);
    return AuthButton(
        isloading: context.watch<AuthCubit>().state is AuthLoadingState,
        width: size.width,
        height: size.width * 0.13,
        radius: size.width * 0.03,
        ontap: () {
          formKey.currentState.validate() &&
                  watchAuthCubit.agreetoterms &&
                  watchAuthCubit.firstNameController.text.length >= 3 &&
                  watchAuthCubit.lastNameController.text.length >= 3
              ? context.read<AuthCubit>().firebaseSendToken()
              : Fluttertoast.showToast(
                  msg: 'Please Validate Form & agree to terms');
        },
        child: AppText(
            text: 'Signup',
            color: Appcolors.white,
            fontweight: FontWeight.w700,
            size: 20));
  }
}

class SigupTermsAndCondition extends StatelessWidget {
  const SigupTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final readAuthCubit = context.read<AuthCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    final size = MediaQuery.sizeOf(context);
    return Terms(
        ontap: () => readAuthCubit.changeAgreetoterms(),
        size: size,
        title: 'Agree to our terms of service & privacy policy guidline',
        status: watchAuthCubit.agreetoterms);
  }
}

class SignupPasswodtTextfield extends StatelessWidget {
  const SignupPasswodtTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final readAuthCubit = context.read<AuthCubit>();
    final watchAuthCubit = context.watch<AuthCubit>();
    return AuthTextfield(
        enableFill: watchAuthCubit.field == 'pass',
        onTap: () => context.read<AuthCubit>().enableInputFields('pass'),
        controller: watchAuthCubit.passwordController,
        obscure: watchAuthCubit.showPassword,
        validator: (value) {
          return AuthValidator.validatePassword(value!);
        },
        suffixicon: InkWell(
            onTap: () {
              readAuthCubit.changeShowpassword();
            },
            child: Icon(
                watchAuthCubit.showPassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: 22.sp)),
        prefixicon: Icon(Icons.lock_outline, size: 25.sp),
        hintext: 'Password');
  }
}

class SignupPhoneTextField extends StatelessWidget {
  const SignupPhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    return AuthTextfield(
        enableFill: watchAuthCubit.field == 'phone',
        onTap: () => context.read<AuthCubit>().enableInputFields('phone'),
        controller: watchAuthCubit.phoneController,
        validator: (value) {
          return AuthValidator.validateMobile(value!);
        },
        keyboardtype: TextInputType.phone,
        prefixicon: Icon(Icons.phone_android_outlined, size: 25.sp),
        hintext: 'Mobile Number');
  }
}

class SignupEmailTextfield extends StatelessWidget {
  const SignupEmailTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final watchAuthCubit = context.watch<AuthCubit>();
    return AuthTextfield(
        enableFill: watchAuthCubit.field == 'email',
        onTap: () => context.read<AuthCubit>().enableInputFields('email'),
        controller: watchAuthCubit.emailController,
        keyboardtype: TextInputType.emailAddress,
        validator: (value) {
          return AuthValidator.validateEmail(value!);
        },
        prefixicon: Icon(Icons.email_outlined, size: 25.sp),
        hintext: 'Email');
  }
}

class SignupFirstnameTextfield extends StatelessWidget {
  const SignupFirstnameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchAuthCubit = context.watch<AuthCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: size.width * 0.45,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AuthTextfield(
                  enableFill: watchAuthCubit.field == 'first',
                  onTap: () =>
                      context.read<AuthCubit>().enableInputFields('first'),
                  enableError: AuthValidator.validateName(
                          watchAuthCubit.firstNameController.text) !=
                      'valid',
                  onChanged: (p0) => watchAuthCubit.updateState(),
                  controller: watchAuthCubit.firstNameController,
                  prefixicon: Icon(Icons.person_outline, size: 25.sp),
                  hintext: 'FirstName'),
              AppText(
                  text: AuthValidator.validateName(
                      watchAuthCubit.firstNameController.text),
                  size: 13,
                  color: AuthValidator.validateName(
                                  watchAuthCubit.firstNameController.text) ==
                              'valid' ||
                          watchAuthCubit.firstNameController.text.isEmpty
                      ? Appcolors.white
                      : Appcolors.redColor)
            ])),
        SizedBox(
            width: size.width * 0.45,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AuthTextfield(
                  enableFill: watchAuthCubit.field == 'last',
                  onTap: () =>
                      context.read<AuthCubit>().enableInputFields('last'),
                  enableError: AuthValidator.validateName(
                          watchAuthCubit.lastNameController.text) !=
                      'valid',
                  onChanged: (p0) => watchAuthCubit.updateState(),
                  controller: watchAuthCubit.lastNameController,
                  prefixicon: Icon(Icons.person_outline, size: 25.sp),
                  hintext: 'LastName'),
              AppText(
                  text: AuthValidator.validateName(
                      watchAuthCubit.lastNameController.text),
                  size: 12,
                  color: AuthValidator.validateName(
                                  watchAuthCubit.lastNameController.text) ==
                              'valid' ||
                          watchAuthCubit.lastNameController.text.isEmpty
                      ? Appcolors.white
                      : Appcolors.redColor)
            ]))
      ],
    );
  }
}
