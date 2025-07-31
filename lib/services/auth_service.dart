import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userPhoneKey = 'userPhone';
  static const String _userRoleKey = 'userRole';

  static Future<void> login(String phone, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPhoneKey, phone);
    await prefs.setString(_userRoleKey, role);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userPhoneKey);
    await prefs.remove(_userRoleKey);
  }

  static Future<String?> getUserPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPhoneKey);
  }

  static Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey);
  }

  static Future<bool> isAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey) == 'admin';
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userPhoneKey);
  }
}