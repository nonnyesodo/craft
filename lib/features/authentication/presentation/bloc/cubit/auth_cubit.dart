import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool showPassword = true;
  bool agreetoterms = false;
  String? verificationCode = '';
  int? resendtoken;
  bool stayLogin = false;
  String countrycode = '+234';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();
  firebaseSendToken() async {
    if (phoneController.text.isNotEmpty) {
      emit(AuthLoadingState());
      var mobile = phoneController.text.replaceFirst(RegExp(r'^0+'), "");
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "$countrycode$mobile",
          verificationCompleted: (PhoneAuthCredential credential) async {
            emit(AuthTokenVerifiedState());
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(InvalidOtpState(msg: e.message!));
            log(e.message.toString());
            Fluttertoast.showToast(
              msg: "${e.message}",
              backgroundColor: Appcolors.blackColor,
              textColor: Appcolors.white,
            );
          },
          codeSent: (String? verificationID, int? resendToken) {
            verificationCode = verificationID;
            resendtoken = resendToken;
            emit(AuthTokenSentState());
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            verificationCode = verificationID;
          },
          forceResendingToken: resendtoken,
          timeout: const Duration(seconds: 120));
    } else {
      // Fluttertoast.showToast(
      //   msg:
      //       AuthTextfieldValidator.mobileValidtor(value: mobileController.text),
      //   backgroundColor: AppColors.bgColor,
      //   textColor: AppColors.blackColor,
      // );
    }
  }

  firebaseTokenVerified() async {
    emit(AuthLoadingState());

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: otpController.text);

      final authResult = await firebaseAuth.signInWithCredential(credential);
      final firebaseUser = authResult.user;

      if (firebaseUser != null) {
        log(authResult.user!.uid.toString());
        otpController.clear();
        emit(AuthTokenVerifiedState());
      } else {
        Fluttertoast.showToast(
          msg: "unable to verify",
          backgroundColor: Appcolors.blackColor,
          textColor: Appcolors.white,
        );
        emit(const AuthErrorState(error: 'mesg:unable to verfy'));
      }
    } on FirebaseAuthException catch (e) {
      // Fluttertoast.showToast(msg: "Error:$e");
      log(e.toString());

      log(e.message.toString());
      emit(InvalidOtpState(msg: e.message.toString()));
    }
  }

  changeShowpassword() {
    emit(AuthLoadingState());
    showPassword = !showPassword;
    log(showPassword.toString());
    emit(AuthLoadedState());
  }

  changeStaylogin() {
    emit(AuthLoadingState());
    stayLogin = !stayLogin;
    log(stayLogin.toString());
    emit(AuthLoadedState());
  }

  changeAgreetoterms() {
    emit(AuthLoadingState());
    agreetoterms = !agreetoterms;
    emit(AuthLoadedState());
  }
}
