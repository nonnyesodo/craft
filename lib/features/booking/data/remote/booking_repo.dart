import 'dart:convert';
import 'dart:developer';

import 'package:craftman/features/booking/domain/booking_interface.dart';
import 'package:http/http.dart';

import '../../../../constants/api_constants.dart';

class BookingRepo implements BookingInterface {
  var client = Client();
  @override
  Future<Response> getBookingHistory() async {
    return await client.get(Uri.parse(Apis.bookingHistory),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> cancelBooking({int? id}) async {
    log(Apis.cancelBooking(id));
    return await client.post(Uri.parse(Apis.cancelBooking(id)),
        headers: ApiHeaders.aunthenticatedHeader);
  }

  @override
  Future<Response> rateArtisan({int? id, int? rating, String? review}) async {
    var body = {"review": review, "rating": rating};
    return await client.post(Uri.parse(Apis.rateArtisan(id)),
        body: jsonEncode(body), headers: ApiHeaders.aunthenticatedHeader);
  }
}
