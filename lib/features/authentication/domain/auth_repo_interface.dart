import 'package:http/http.dart';

abstract class AuthRepoInterface {
  Future<Response> register(
      {required String email,
      required String password,
      required String mobile,
      required String name});
  Future<Response> login({required String email, required String password});

  Future<Response> deleteAccount();
}
