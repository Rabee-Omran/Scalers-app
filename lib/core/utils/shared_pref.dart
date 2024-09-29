import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final SharedPreferences sharedPreferences;

  SharedPref({required this.sharedPreferences});

  String get languageCode =>
      sharedPreferences.getString('languageCode') ?? 'en';
  void setLanguageCode(String languageCode) {
    sharedPreferences.setString("languageCode", languageCode);
  }

  Future<void> clear() async {
    final lang = languageCode;
    await sharedPreferences.clear();
    setLanguageCode(lang);
  }
}
