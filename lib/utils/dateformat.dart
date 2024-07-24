import 'package:intl/intl.dart'; // Import the intl package

class NewsUtils {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd - HH:mm').format(dateTime);
  }
}
