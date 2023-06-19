import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/data/api_error_codes.dart';
import 'package:mjpt_pas/model/login_mobile_response.dart';
import 'package:mjpt_pas/model/update_mpin_payload.dart';
import 'package:mjpt_pas/model/update_mpin_response.dart';
import 'package:mjpt_pas/repository/update_mpin_repository.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/constants/shared_pref_consts.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateMpinViewModel with ChangeNotifier {
  final _updateMpinRepository = UpdateMpinRepository();
 
  LoginData? loginMobileData;

UpdateMpinResponse _updateMpinResponse = UpdateMpinResponse();

  updateMpinService(context, String mpin ,String reset) async {
   loginMobileData = await getLoginInfo(SharedPrefConstants.loginResponse);
    print("object ${loginMobileData?.designation}");
    var updateMpinPayload = UpdateMpinPayload();
    updateMpinPayload.appName = AppStrings.appName;
    var getMpinUserModel = GetMpinUserModel();
    getMpinUserModel.mobileNumber = loginMobileData?.mobileNumber;
    getMpinUserModel.mpin = mpin;
     getMpinUserModel.userId = loginMobileData?.userId;
      getMpinUserModel.userName = loginMobileData?.userName;
      updateMpinPayload.userModel = getMpinUserModel;

    try {
      _updateMpinResponse =
          await _updateMpinRepository.updateMpin(updateMpinPayload,loginMobileData?.authToken);
      print("status message: " + _updateMpinResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_updateMpinResponse.statusCode == ApiErrorCodes.SUCCESS_code) {
        if(reset=="reset"){
          AppToast().showToast(_updateMpinResponse.statusMessage??"");
           Navigator.pushNamed(
              context,
              AppRoutes.login,
            );
        }else{
 Navigator.pushNamed(
              context,
              AppRoutes.validateMpin,
            );
        }
        
        return loginMobileData;
      } else if (_updateMpinResponse.statusCode ==
          ApiErrorCodes.failure_code) {
            showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _updateMpinResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        
      } else if (_updateMpinResponse.statusCode ==
          ApiErrorCodes.server_error_code) {
      
            showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _updateMpinResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      } else {
        EasyLoading.dismiss();
       showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _updateMpinResponse.statusMessage.toString(),
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

  Future<LoginData> getLoginInfo(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(preferences.getString(key) ?? "");
    LoginData user = LoginData.fromJson(userMap);
    print("user... :${user.latitude} ");
    return user;
  }

  
}
