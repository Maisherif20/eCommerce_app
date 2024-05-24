import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setToken(String token) {
    prefs.setString("token", token);
  }
  static setAddress(String details , String city) {
    prefs.setString("details", details);
    prefs.setString("city", city);
  }

  static setMobileNum(String mobileNum) {
    prefs.setString("mobileNum", mobileNum);
  }

  static setUserData(String email, String name) {
    prefs.setString("email", email);
    prefs.setString("name", name);
  }

  static String getToken() {
    return prefs.getString("token") ?? "";
  }
  static String getAddress() {
    return prefs.getString("details") ?? "";
  }

  static String getEmail() {
    return prefs.getString("email") ?? "";
  }

  static String getname() {
    return prefs.getString("name") ?? "";
  }

  static String getMobileNum() {
    return prefs.getString("mobileNum") ?? "";
  }

  static logout() {
    prefs.clear();
  }

  static void saveData(String key, dynamic value) {
    Map<String, dynamic> dataMap = prefs.getString('dataMap') != null
        ? Map<String, dynamic>.from(jsonDecode(prefs.getString('dataMap')!))
        : {};
    dataMap[key] = value;
    prefs.setString('dataMap', jsonEncode(dataMap));
  }

  static Map<String, dynamic> getDataMap() {
    SharedPreferences prefs =
        SharedPreferences.getInstance() as SharedPreferences;
    String? jsonString = prefs.getString('dataMap');
    Map<String, dynamic> dataMap = jsonString != null
        ? Map<String, dynamic>.from(jsonDecode(jsonString))
        : {};
    return dataMap;
  }
}
