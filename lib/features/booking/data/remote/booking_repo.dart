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
}
