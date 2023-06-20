import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/model/leave_payload.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api_error_codes.dart';
import '../model/leave_response.dart';
import '../model/leave_time_zone_payload.dart';
import '../model/leave_time_zone_response.dart';
import '../model/login_mobile_response.dart';
import '../repository/Apply Leave/leave_repository.dart';
import '../repository/Apply Leave/leave_time_zone_repository.dart';
import '../res/app_alerts/custom_error_alert.dart';
import '../res/components/get_shared_pref.dart';
import '../res/constants/image_constants.dart';
import '../res/constants/shared_pref_consts.dart';
import '../utils/deviceid.dart';

class ApplyLeaveViewModel extends ChangeNotifier {
  GetSharedPref getSharedPref = GetSharedPref();
  LoginData? loginMobileData;
  final _leaveRepository = LeaveRepository();
  final _leaveTimeZoneRepository = LeaveTimeZoneRepository();
  LeaveResponse _leaveResponse = LeaveResponse();
  LeaveTimeZoneResponse _leaveTimeZoneResponse = LeaveTimeZoneResponse();

  final utils = Utils();
  LeaveData? leaveData; 
  List<LeaveTimeZoneData?>? leaveTimeZoneData;
  LeaveService(context) async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    loginMobileData =
        await getSharedPref.getLoginInfo(SharedPrefConstants.loginResponse);
    print("object ${loginMobileData?.designation}");

    final _leavePayload = LeavePayload(
      appName: AppStrings.appName,
      leaveBalanceModel: LeaveBalanceModel(
        employeeId: loginMobileData?.employeeId,
      ),
      sessionToken: loginMobileData?.sessionToken,
      userId: loginMobileData?.userId,

    );

    try {
      _leaveResponse =
          await _leaveRepository.leave(_leavePayload, loginMobileData?.authToken);
      print("status message: " + _leaveResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_leaveResponse.statusCode == ApiErrorCodes.SUCCESS_code) {
        if (_leaveResponse.data != null) {
          leaveData = _leaveResponse.data;
        }
        else{
          showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _leaveResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        }
        return leaveData;
      }
      else {
        showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _leaveResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      }

    } on Exception catch (e) {
      EasyLoading.dismiss();
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

  LeaveTimeZoneService(context) async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);

    final _leaveTimeZonePayload = LeaveTimeZonePayload(
      appName: AppStrings.appName,
    );

    try {
      _leaveTimeZoneResponse =
          await _leaveTimeZoneRepository.leaveTimeZone(_leaveTimeZonePayload, loginMobileData?.authToken);
      print("status message: " + _leaveTimeZoneResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_leaveTimeZoneResponse.statusCode == ApiErrorCodes.SUCCESS_code) {
        if (_leaveTimeZoneResponse.data != null) {
          leaveTimeZoneData = _leaveTimeZoneResponse.data;
        }
        else{
          showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _leaveTimeZoneResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        }
        return leaveTimeZoneData;
      }
      else {
        showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _leaveTimeZoneResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
      }

    } on Exception catch (e) {
      EasyLoading.dismiss();
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
}
