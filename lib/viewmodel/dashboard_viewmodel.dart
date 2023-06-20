import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/encryption/aes_encrption.dart';
import 'package:mjpt_pas/model/dashboard_menu_payload.dart';
import 'package:mjpt_pas/model/dashboard_menu_response.dart';

import 'package:mjpt_pas/model/login_mobile_response.dart';

import 'package:mjpt_pas/model/validate_mpin_payload.dart';
import 'package:mjpt_pas/repository/dashboard_repository.dart';
import 'package:mjpt_pas/repository/validate_mpin_repository.dart';
import 'package:mjpt_pas/res/app_alerts/custom_error_alert.dart';
import 'package:mjpt_pas/res/app_alerts/custom_warning_alert.dart';
import 'package:mjpt_pas/res/constants/image_constants.dart';
import 'package:mjpt_pas/res/routes/App_routes.dart';

import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api_error_codes.dart';

class DashboardViewModel extends ChangeNotifier {
  final _dashboardRepository = DashboardRepository();
  DashboardMenuResponse response = DashboardMenuResponse();

  LoginData? loginMobileData;
  List<DashboardMenuList>? dashboardMenuList = [];
  List<DashboardMenuList>? get getDashboardList => dashboardMenuList;

  dashboardService(context, LoginData? loginMobileData) async {
    /* oginMobileData = await getLoginInfo(SharedPrefConstants.loginResponse);
    print("object ${loginMobileData?.designation}"); */
    ;
    var dashboardPayload = DashboardMenuPayload();
    dashboardPayload.appName = AppStrings.appName;
    dashboardPayload.sessionToken = loginMobileData?.sessionToken;
    dashboardPayload.userId = loginMobileData?.userId;
    var dashboardMenuModel = DashboardMenuModel();
    dashboardMenuModel.employeeId = loginMobileData?.employeeId;
    dashboardMenuModel.roleId = loginMobileData?.roleId;
    dashboardPayload.roleServiceModel = dashboardMenuModel;

    try {
      response = await _dashboardRepository.callDashboardMenuList(
          dashboardPayload, loginMobileData?.authToken);
      EasyLoading.dismiss();
      if (response.statusCode == ApiErrorCodes.SUCCESS_code) {
        if (response.data != null) {
          dashboardMenuList = response.data;
          /*  loginMobileData = await getLoginInfo(SharedPrefConstants.loginResponse);
          print("object ${loginMobileData?.designation}"); */
        }
      } else if (response.statusCode == ApiErrorCodes.data_notfound) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomWarningAlert(
                descriptions: response.statusMessage.toString(),
                onPressed: () {
                  Navigator.pop(context);
                },
                Img: AssetPath.warning);
          },
        );
      } else if (response.statusCode == ApiErrorCodes.session_expiry) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomErrorAlert(
                descriptions: response.statusMessage.toString(),
                onPressed: () {
                  Navigator.pop(context);
                },
                Img: AssetPath.error);
          },
        );
      } else if (response.statusCode == ApiErrorCodes.failure_code) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomErrorAlert(
                descriptions: response.statusMessage.toString(),
                onPressed: () {
                  Navigator.pop(context);
                },
                Img: AssetPath.error);
          },
        );
      } else if (response.statusCode == ApiErrorCodes.server_error_code) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomErrorAlert(
                descriptions: response.statusMessage.toString(),
                onPressed: () {
                  Navigator.pop(context);
                },
                Img: AssetPath.error);
          },
        );
      } else {
        EasyLoading.dismiss();
        showDialog(
          context: context,
          builder: (context) {
            return CustomErrorAlert(
                descriptions: response.statusMessage.toString(),
                onPressed: () {
                  Navigator.pop(context);
                },
                Img: AssetPath.error);
          },
        );
      }
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomErrorAlert(
              descriptions: AppStrings.server_not_responding,
              onPressed: () {
                Navigator.pop(context);
              },
              Img: AssetPath.error);
        },
      );
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
