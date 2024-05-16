import 'dart:convert';
import 'dart:developer';

import 'package:craftman/constants/api_constants.dart';
import 'package:craftman/features/home/domain/home_repo_interface.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class HomeRepo implements HomeInterface {
  var client = Client();
  @override
  Future<Response> getCategories() async {
    return await client.get(Uri.parse(Apis.categories),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> getSubCategories({int? id}) async {
    log(ApiHeaders.aunthenticatedHeader.entries.toString());
    return await client.get(Uri.parse(Apis.subCat(id)),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> bookArtisan({int? id}) async {
    log(Apis.bookArtisan(id).toString());
    var body = {
      "date_time": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
    };
    log(body.entries.toString());
    return await client.post(Uri.parse(Apis.bookArtisan(id)),
        body: jsonEncode(body), headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> fetchNotification() async {
    return await client.get(Uri.parse(Apis.getNotification),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> getPopularService() async {
    return await client.get(Uri.parse(Apis.popularService),
        headers: ApiHeaders.aunthenticatedHeader);
  }
}
