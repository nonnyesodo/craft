import 'package:http/http.dart';

abstract class AcctRepoInterface {
  Future<Response> updateUserInfo(
      {String? name, String? mobile, String? address});
}
