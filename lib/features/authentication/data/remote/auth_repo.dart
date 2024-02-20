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
    var url = Uri.parse(Apis.login);
    log(url.toString());
    var response = await client.post(url,
        body: jsonEncode(body), headers: ApiHeaders.unaunthenticatedHeader);
    return response;
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
    var url = Uri.parse(Apis.register);
    log(url.toString());
    var response = await client.post(url,
        body: jsonEncode(body), headers: ApiHeaders.unaunthenticatedHeader);
    return response;
  }

  @override
  Future<Response> deleteAccount() async {
    var url = Uri.parse(Apis.delete);
    log(url.toString());
    log('${ApiHeaders.aunthenticatedHeader.values}');
    var response =
        await client.delete(url, headers: ApiHeaders.aunthenticatedHeader);
    return response;
  }

  @override
  Future<Response> verifyEmail({required String code}) async {
    var url = Uri.parse(Apis.verifyEmail);
    var body = {'code': code};
    log('${ApiHeaders.aunthenticatedHeader.values}');
    var response = await client.post(url,
        body: jsonEncode(body), headers: ApiHeaders.aunthenticatedHeader);
    return response;
  }

  @override
  Future<Response> resendEmailOtp() async {
    var url = Uri.parse(Apis.resendEmailOtp);
    log('${ApiHeaders.aunthenticatedHeader.values}');
    var response =
        await client.post(url, headers: ApiHeaders.aunthenticatedHeader);
    return response;
  }
}
