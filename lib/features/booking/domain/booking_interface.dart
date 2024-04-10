import 'package:http/http.dart';

abstract class BookingInterface {
  Future<Response> getBookingHistory();
  Future<Response> cancelBooking();
  Future<Response> rateArtisan();
}
