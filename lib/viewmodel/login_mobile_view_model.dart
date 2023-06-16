import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mjpt_pas/data/api_error_codes.dart';
import 'package:mjpt_pas/model/login_mobile_payload.dart';
import 'package:mjpt_pas/repository/login_mobile_repository.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:mjpt_pas/utils/deviceid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/local_store_helper.dart';
import '../encryption/aes_encrption.dart';
import '../encryption/aes_encrption.dart';
import '../model/login_mobile_response.dart';
import '../res/Routes/App_routes.dart';
import '../res/app_alerts/custom_error_alert.dart';
import '../res/constants/image_constants.dart';
import '../res/constants/shared_pref_consts.dart';

class LoginMobileViewModel with ChangeNotifier {
  final _loginMobileRepository = LoginMobileRepository();
  final utils = Utils();
  String? device_id;
  String? device_type;
  String? en_mobile;
  String? dec_mobile;
  LoginMobileResponse _loginMobileResponse = LoginMobileResponse();
  LoginData? loginMobileData;

  loginMobileValidation(String mobileNumber, context) async {
    if (mobileNumber.isEmpty) {
      AppToast().showToast(AppStrings.mobilenumber_empty);
      return false;
    } else if (mobileNumber.length != 10) {
      AppToast().showToast(AppStrings.mobilenumber_invalid);
      return false;
    } else if (!RegExp(r'^([6-9]{1})([0-9]{9})$').hasMatch(mobileNumber)) {
      AppToast().showToast(AppStrings.mobilenumber_invalid);
      return false;
    } else {
      //LoginMobileViewModel viewModel = LoginMobileViewModel();

      dec_mobile = AesEncription().decryption(en_mobile ?? '');
      print("encrypted mobile: " + en_mobile!);
      print("decrypted mobile: " + dec_mobile!);
      notifyListeners();
      return true;
    }
  }

  loginMobileService<Data>(context, String mobile) async {
    en_mobile = AesEncription().encryption(mobile);
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
      mobileNumber: en_mobile,
      password: "",
      username: "",
    );

    try {
      _loginMobileResponse =
          await _loginMobileRepository.loginMobile(loginMobilePayload);
      print("status message: " + _loginMobileResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_loginMobileResponse.statusCode == ApiErrorCodes.SUCCESS_code) {
        if (_loginMobileResponse.data != null) {
          loginMobileData = _loginMobileResponse.data;
          saveLoginResponse("login", loginMobileData!);
          /*  loginMobileData = await getLoginInfo("login");
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
          CustomErrorAlert(
              descriptions: _loginMobileResponse.statusMessage.toString(),
              onPressed: () {
                Navigator.pop(context);
              },
              Img: AssetPath.bg_image);
        }

        return loginMobileData;
      } else if (_loginMobileResponse.statusCode ==
          ApiErrorCodes.failure_code) {
        CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.bg_image);
      } else if (_loginMobileResponse.statusCode ==
          ApiErrorCodes.server_error_code) {
        CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.bg_image);
      } else {
        EasyLoading.dismiss();
        CustomErrorAlert(
            descriptions: _loginMobileResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.bg_image);
      }
    } on Exception catch (e) {
      CustomErrorAlert(
          descriptions: AppStrings.server_not_responding,
          onPressed: () {
            Navigator.pop(context);
          },
          Img: AssetPath.bg_image);
      print("Exception: " + e.toString());
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
