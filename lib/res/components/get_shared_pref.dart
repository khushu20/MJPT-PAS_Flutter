import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_mobile_response.dart';

class GetSharedPref {

  Future<LoginData> getLoginInfo(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(preferences.getString(key) ?? "");
    LoginData user = LoginData.fromJson(userMap);
    print("user... :${user.employeeName} ");
    return user;
  }
}