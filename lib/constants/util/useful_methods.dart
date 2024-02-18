import 'package:intl/intl.dart';

class Utils {
  static getGreting() {
    var time = DateFormat.jm().format(DateTime.now());
    var hour = DateFormat.H().format(DateFormat("hh").parse(time));
    if (time.contains('AM')) {
      return 'Morning';
    } else if (int.parse(hour) <= 3 && time.contains('PM')) {
      return 'Afternoon';
    } else if (int.parse(hour) >= 4 && time.endsWith('PM')) {
      return 'Evening';
    }
  }
}
