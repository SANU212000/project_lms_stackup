import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // A private static variable to hold the instance of SharedPreferences
  static SharedPreferences? _prefs;

  // Initializes the SharedPreferences instance and returns it
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  // Sets a string value in SharedPreferences for the given key
  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  // Retrieves a string value from SharedPreferences for the given key
  static String? getString(String key) => _prefs!.getString(key);

  // Clears all data from SharedPreferences
  static Future<bool> clear() async => await _prefs!.clear();
}
