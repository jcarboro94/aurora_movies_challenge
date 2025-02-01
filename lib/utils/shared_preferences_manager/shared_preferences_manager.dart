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
    return prefs.getString('authToken') ??
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWQ3YjBhMTNmOGNlODBmOTBlOWFmMGVhNDA2NGEwOCIsIm5iZiI6MTczNzk3Njc2Mi43Miwic3ViIjoiNjc5NzZiYmEwOWMyNTJlM2FiMjNjZmQ1Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.kPzZAQJ7IsvFHJhwV7JcQX7u13JqcLg0sILfDenLjio';
  }
}
