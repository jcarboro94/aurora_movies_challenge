import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // This method should be used under normal circumstances where tokens change, for this challenge it will be left
  // unused.
  Future<void> setAuthKey(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
  }

  // In this case, the token is hardcoded, so this method will always return the same value.
  Future<String?> getAuthKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken') ?? dotenv.env['AUTH_TOKEN'];
  }
}
