import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/features/authentication/data/local/auth_validator.dart';
import 'package:craftman/features/authentication/data/model/user_model.dart';
import 'package:craftman/features/authentication/data/remote/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

String bearerToken = '';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());
  UserModel user = UserModel();
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
  final addressController = TextEditingController();

  firebaseSendToken() async {
    if (phoneController.text.isNotEmpty) {
      emit(AuthLoadingState());
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber:
              "$countrycode${phoneController.text.replaceFirst(RegExp(r'^0+'), "")}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            emit(AuthTokenVerifiedState());
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(InvalidOtpState(msg: e.message!));
            log(e.message.toString());
            Fluttertoast.showToast(msg: "${e.message}");
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
      Fluttertoast.showToast(
          msg: AuthValidator.validateMobile(phoneController.text)!);
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

  bool showTimer = true;
  changeShowTimer() {
    emit(AuthLoadingState());
    showTimer = !showTimer;
    emit(AuthLoadedState());
  }

  updateState() {
    emit(AuthLoadingState());
    emit(AuthLoadedState());
  }

  String field = '';
  enableInputFields(String value) {
    emit(AuthLoadingState());
    field = value;
    emit(AuthLoadedState());
  }

  changeAgreetoterms() {
    emit(AuthLoadingState());
    agreetoterms = !agreetoterms;
    emit(AuthLoadedState());
  }

  login() async {
    emit(AuthLoadingState());
    log('here');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loginInfo = prefs.getStringList("login") ?? [];
    if (loginInfo.isNotEmpty) {
      emailController.text = loginInfo.first;
      passwordController.text = loginInfo.last;
    }
    try {
      final response = await authRepo.login(
          email: emailController.text, password: passwordController.text);
      final body = jsonDecode(response.body);
      log(body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 400) {
        prefs.remove('login');
      }
      if (response.statusCode == 200) {
        user = UserModel.fromJson(body['data']);
        bearerToken = user.bearerToken!;
        if (stayLogin) {
          prefs.setStringList(
              "login", [emailController.text, passwordController.text]);
        }
        emit(AuthLoginState());
      } else {
        Fluttertoast.showToast(msg: body['message']);
        emit(const AuthErrorState(error: 'error'));
      }
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorState(error: 'error'));
    }
  }

  register() async {
    emit(AuthLoadingState());
    try {
      final response = await authRepo.register(
          email: emailController.text,
          password: passwordController.text,
          mobile: phoneController.text,
          name: '${firstNameController.text} ${lastNameController.text}');
      final body = jsonDecode(response.body);
      log(body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        user = UserModel.fromJson(body['data']);
        bearerToken = user.bearerToken!;
        emit(AuthRegisterState());
      } else {
        Fluttertoast.showToast(msg: body['message']);
        emit(const AuthErrorState(error: 'error'));
      }
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorState(error: 'error'));
    }
  }

  deleteUser() async {
    emit(AuthLoadingState());
    try {
      final response = await authRepo.deleteAccount();
      final body = jsonDecode(response.body);
      log(body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(body.toString());
        emit(AuthLoadedState());
      } else {
        emit(const AuthErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorState(error: 'error'));
    }
  }

  verifyEmail() async {
    emit(AuthLoadingState());
    try {
      final response = await authRepo.verifyEmail(code: otpController.text);
      final body = jsonDecode(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(body.toString());
        emit(AuthEmailVerifiedState());
      } else {
        emit(const AuthErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorState(error: 'error'));
    }
  }

  resendEmailOtp() async {
    emit(AuthLoadingState());
    try {
      final response = await authRepo.resendEmailOtp();
      final body = jsonDecode(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(body.toString());
        emit(AuthEmailOtpSentState());
        Fluttertoast.showToast(msg: body['message']);
      } else {
        emit(const AuthErrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      log(e.toString());
      emit(const AuthErrorState(error: 'error'));
    }
  }

  logout() async {
    emit(AuthLoadingState());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('login');
    emit(AuthLogoutState());
    user = UserModel();
  }

  getUserInfo() async {
    emit(AuthLoadingState());
    firstNameController.text = user.firstName! + user.lastname!;
    phoneController.text = user.mobileNumber!;
    emailController.text = user.email!;
    // addressController = user.
    emit(AuthLoadedState());
  }
}
