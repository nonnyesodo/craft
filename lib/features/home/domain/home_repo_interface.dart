import 'package:http/http.dart';

abstract class HomeInterface {
  Future<Response> getCategories();
  Future<Response> getSubCategories();
  Future<Response> bookArtisan();

  Future<Response> fetchNotification();
}
