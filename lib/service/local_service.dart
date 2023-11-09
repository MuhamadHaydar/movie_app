import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static String LAGUAGE_CODE = 'languageCode';
  static String SPLASH_CODE = "splashCode";

  static const String ENGLISH = 'en';
  static const String KURDI = 'fa';
  static const String ARABIC = 'ar';

  static Future<Locale> setLocale(String languageCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(LAGUAGE_CODE, languageCode);
    return _locale(languageCode);
  }

  static Future<Locale> getLocale() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
    return _locale(languageCode);
  }

  static Locale _locale(String languageCode) {
    switch (languageCode) {
      case ENGLISH:
        return Locale(ENGLISH, '');
      case KURDI:
        return Locale(KURDI, "");
      case ARABIC:
        return Locale(ARABIC, "");
      default:
        return Locale(ENGLISH, '');
    }
  }

// AppLocalizations translation(BuildContext context) {
//   return AppLocalizations.of(context)!;
// }
}
