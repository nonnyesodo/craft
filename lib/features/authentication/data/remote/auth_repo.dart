import 'dart:convert';
import 'dart:developer';

import 'package:craftman/constants/api_constants.dart';
import 'package:craftman/features/authentication/domain/auth_repo_interface.dart';
import 'package:http/http.dart';

class AuthRepo implements AuthRepoInterface {
  var client = Client();
  @override
  Future<Response> login(
      {required String email, required String password}) async {
    var body = {'email': email, 'password': password};
    return await client.post(Uri.parse(Apis.login),
        body: jsonEncode(body), headers: ApiHeaders.unaunthenticatedHeader);
  }

  @override
  Future<Response> register(
      {required String email,
      required String password,
      required String mobile,
      required String name}) async {
    var body = {
      'email': email,
      'password': password,
      'mobile_number': mobile,
      'name': name
    };
    return await client.post(Uri.parse(Apis.register),
        body: jsonEncode(body), headers: ApiHeaders.unaunthenticatedHeader);
  }

  @override
  Future<Response> deleteAccount() async {
    return await client.delete(Uri.parse(Apis.delete),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> verifyEmail({required String code}) async {
    var body = {'code': code};
    return await client.post(Uri.parse(Apis.verifyEmail),
        body: jsonEncode(body), headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> resendEmailOtp() async {
    return await client.post(Uri.parse(Apis.resendEmailOtp),
        headers: ApiHeaders.aunthenticatedHeader);
  }
}
