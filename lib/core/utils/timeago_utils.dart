import 'shared_pref.dart';
import '../../injection_container.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgo {
  static String format(DateTime dateTime) {
    return timeago.format(dateTime, locale: sl<SharedPref>().languageCode);
  }

  static void initLanguages() {
    timeago.setLocaleMessages('en', timeago.EnMessages());
    timeago.setLocaleMessages('ar', timeago.ArMessages());
  }
}
