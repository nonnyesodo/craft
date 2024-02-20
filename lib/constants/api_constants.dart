import 'package:craftman/features/authentication/presentation/bloc/cubit/auth_cubit.dart';

class Apis {
  static const String baseUrl = 'https://guru.alwaysdata.net/craftman/';
  static const String register = '${baseUrl}api/v1/register';
  static const String login = '${baseUrl}api/v1/login';
  static const String delete = '${baseUrl}api/v1/user';
  static const String verifyEmail = '${baseUrl}api/v1/email/verify';
  static const String resendEmailOtp = '${baseUrl}api/v1/email/send-code';
}

class ApiHeaders {
  static const unaunthenticatedHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static final aunthenticatedHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $bearerToken'
  };
}
