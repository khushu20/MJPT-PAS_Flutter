

import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/data/api_error_codes.dart';
import 'package:mjpt_pas/data/local_store_helper.dart';
import 'package:mjpt_pas/encryption/aes_encrption.dart';
import 'package:mjpt_pas/model/login_mobile_payload.dart';
import 'package:mjpt_pas/model/login_mobile_response.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/constants/shared_pref_consts.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:mjpt_pas/utils/deviceid.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../repository/login_mobile_repository.dart';

class LoginViewModel with ChangeNotifier {
  final _loginMobileRepository = LoginMobileRepository();
  final utils = Utils();
  String? device_id="",device_type="",en_username="",en_password="";
  LoginMobileResponse _loginMobileResponse = LoginMobileResponse();
  LoginData? loginMobileData;

    loginUserNameService(context, String username,String password) async {
    en_username = AesEncription().encryption(username);
    en_password = AesEncription().encryption(password);
      print("en_username: $en_username" );
       print("en_username: $en_password" );
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    device_id = await utils.getDeviceId() ?? '';
    device_type = await utils.getDeviceType() ?? '';
    final loginMobilePayload = LoginMobilePayload(
      appName: AppStrings.appName,
      deviceId: device_id,
      deviceType: device_type,
      fcmToken:
          "dNnn-ap1TtepcrNZsCq_KH:APA91bEo5YCX8Jszi1fjqVxdIPJLqQljm3B9XCugwq1m9_Tt5qPigFvi0eD_vHxYsALtm7imXe6PglGsm73q5H0-UZ0FrVVGpzinP6SsGld0C08i0cz1ruIvfVxq_Ii8lRlS7i2h5HGn",
      isMobileNoAuth: true,
      mobileNumber: "",
      password: en_password,
      username: en_username
    );

    try {
      _loginMobileResponse =
          await _loginMobileRepository.loginMobile(loginMobilePayload);
      print("status message: " + _loginMobileResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_loginMobileResponse.statusCode == ApiErrorCodes.SUCCESS_code) {
        if (_loginMobileResponse.data != null) {
          loginMobileData = _loginMobileResponse.data;
          saveLoginResponse(SharedPrefConstants.loginResponse, loginMobileData!);
           await LocalStoreHelper().writeTheData(SharedPrefConstants.otpMobile, loginMobileData?.otpMobile);
                  await LocalStoreHelper().writeTheData(SharedPrefConstants.mPin, loginMobileData?.mpin);
                   await LocalStoreHelper().writeTheData(SharedPrefConstants.authToken,loginMobileData?.authToken);
                   
          /*  loginMobileData = await getLoginInfo(SharedPrefConstants.loginResponse);
          print("object ${loginMobileData?.designation}"); */

          if (loginMobileData?.otpMobile != null &&
              loginMobileData?.mpin == "") {
            Navigator.pushNamed(
              context,
              AppRoutes.validateOtp,
            );
          } else if (loginMobileData?.mpin != null &&
              loginMobileData?.mpin != "") {
            Navigator.pushNamed(
              context,
              AppRoutes.validateMpin,
            );
          }
        } else {
           showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        }

        return loginMobileData;
      } else if (_loginMobileResponse.statusCode ==
          ApiErrorCodes.failure_code) {
            showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        
      } else if (_loginMobileResponse.statusCode ==
          ApiErrorCodes.server_error_code) {
         showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      } else {
        EasyLoading.dismiss();
        showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      }
    } on Exception catch (e) {
      showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: AppStrings.server_not_responding,
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
    }
  }

  Future<void> saveLoginResponse(String key, LoginData loginData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(LoginData.fromJson(loginData.toJson()));
    print("user: " + user);
    pref.setString(key, user);
  }

  Future<LoginData> getLoginInfo(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(preferences.getString(key) ?? "");
    LoginData user = LoginData.fromJson(userMap);
    print("user... :${user.latitude} ");
    return user;
  }
}
  


