import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/encryption/aes_encrption.dart';

import 'package:mjpt_pas/model/login_mobile_response.dart';

import 'package:mjpt_pas/model/validate_mpin_payload.dart';
import 'package:mjpt_pas/repository/validate_mpin_repository.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/routes/App_routes.dart';

import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api_error_codes.dart';



import '../model/validate_mpin_response.dart';

class ValidateMpinViewModel extends ChangeNotifier {
  final _validateMpinRepository = ValidateMpinRepository();
  ValidateMpinResponse response = ValidateMpinResponse();


  LoginData? loginMobileData;
 

  validateMpinService(context, String enteredMpin, LoginData? loginMobileData) async {
    /* oginMobileData = await getLoginInfo(SharedPrefConstants.loginResponse);
    print("object ${loginMobileData?.designation}"); */
    String en_mpin = AesEncription().encryption(enteredMpin);
    var validateMpinPayload = ValidateMpinPayload();
    validateMpinPayload.appName = AppStrings.appName;
    var validateMpinModel = ValidateMpinModel();
    validateMpinModel.mobileNumber = loginMobileData?.mobileNumber;
    validateMpinModel.mpin = en_mpin;
     validateMpinModel.userId = loginMobileData?.userId;
      validateMpinModel.userName = loginMobileData?.userName;
      validateMpinPayload.userModel = validateMpinModel;
  
    
        try {
          response = await _validateMpinRepository.validateMpin(
              validateMpinPayload, loginMobileData?.authToken);
          EasyLoading.dismiss();
      if (response.statusCode == ApiErrorCodes.SUCCESS_code) {
        
 Navigator.pushNamed(
              context,
              AppRoutes.LeaveReport,
            );
        
        
        
      } else if (response.statusCode ==
          ApiErrorCodes.failure_code) {
            showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: response.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        
      } else if (response.statusCode ==
          ApiErrorCodes.server_error_code) {
      
            showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: response.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      } else {
        EasyLoading.dismiss();
       showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: response.statusMessage.toString(),
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

     
  

  

