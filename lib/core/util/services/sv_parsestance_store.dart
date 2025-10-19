import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SvParsestanceStore {
  SvParsestanceStore._();
  static SvParsestanceStore instance = SvParsestanceStore._();
  late SharedPreferences sharedPreferences;

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveData(Map<String, dynamic> data) async {
    await sharedPreferences.setString("data", jsonEncode(data));
  }

  Future<List<String>> getData() async {
    List<String>? list = await sharedPreferences.getStringList("data");
    
    return list ?? [];
  }
}
