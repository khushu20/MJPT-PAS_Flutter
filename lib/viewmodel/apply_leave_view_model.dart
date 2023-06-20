import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/model/leave_payload.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/res/constants/app_constants.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api_error_codes.dart';
import '../model/check_if_leave_exists_payload.dart';
import '../model/check_if_leave_exists_response.dart';
import '../model/leave_response.dart';
import '../model/leave_time_zone_payload.dart';
import '../model/leave_time_zone_response.dart';
import '../model/login_mobile_response.dart';
import '../repository/Apply Leave/check_if_leave_exists_repository.dart';
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
  final _checkLeaveExistsRepository = CheckIfLeaveExistsRepository();
  LeaveResponse _leaveResponse = LeaveResponse();
  LeaveTimeZoneResponse _leaveTimeZoneResponse = LeaveTimeZoneResponse();
  CheckIfLeaveExistsResponse _checkIfLeaveExistsResponse = CheckIfLeaveExistsResponse();
  final utils = Utils();
  LeaveData? leaveData; 
  List<LeaveTimeZoneData?>? leaveTimeZoneData;
  CheckLeaveExistsData? checkLeaveExistsData;
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

   validateFileds (String leaveType, int leaveId, String timeZone, int timeId, String fromDate, context, String toDate ){
    print("todate $toDate");
    print("timezone $timeZone");
    if(leaveType.isEmpty || leaveId == 0) {
      AppToast().showToast(AppStrings.leave_type_empty);
    }
    else if(timeZone.isEmpty || timeId == 0) {
      AppToast().showToast(AppStrings.time_zone_empty);
    }
    else if(fromDate.isEmpty) {
      AppToast().showToast(AppStrings.from_date_empty);
    }
    else if(timeZone.isNotEmpty && timeId == 4) {
      print("entered in this");
       if(toDate.isEmpty) {
        AppToast().showToast(AppStrings.to_date_empty);
        
      }
      else {
        print("entered in else");
        return true;
      }
    }
    else {
      print("mmmmmmmmmm");
      return true;
    }

  }

   checkLeavesExists (String leaveType, int leaveId, String timeZone, int timeId, String fromDate, context, String toDate) async {
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
   print("leave id $leaveId");
    print("time id $timeId");
    print("from date $fromDate");
    print("to date $toDate");
    print("time zone $timeZone");
    print("employee id ${loginMobileData?.employeeId}");
    print("session token ${loginMobileData?.sessionToken}");
    print("user id ${loginMobileData?.userId}");
    if(toDate.isEmpty) {
      toDate = fromDate;
    }
    final _checkLeaveExistsPayload = CheckIfLeaveExistsPayload(
      appName: AppStrings.appName,
      leaveBalanceModel: CheckLeaveBalanceModel(
        fileName: "",
        leaveDocument: "",
        leaveTimeZoneId: timeId,
        employeeId: loginMobileData?.employeeId,
        leaveId: leaveId,
        fromDate: fromDate,
        toDate: toDate,
      ),
      sessionToken: loginMobileData?.sessionToken,
      userId: loginMobileData?.userId,
    );

    try {
      _checkIfLeaveExistsResponse =
          await _checkLeaveExistsRepository.checkIfLeaveExistsMethod(_checkLeaveExistsPayload, loginMobileData?.authToken);
          notifyListeners();
      print("status message: " + _checkIfLeaveExistsResponse.statusMessage.toString());
      EasyLoading.dismiss();
      if (_checkIfLeaveExistsResponse.statusCode == ApiErrorCodes.success_888) {
        if (_checkIfLeaveExistsResponse.data?.numberOfDays != null) {
          checkLeaveExistsData = _checkIfLeaveExistsResponse.data;
          AppConstants.checkIfLeaveExistflag = false;
          
          notifyListeners();
        }
        else{
          showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _checkIfLeaveExistsResponse.statusMessage.toString(),
            onPressed: () {
              Navigator.pop(context);
            },
            Img: AssetPath.error);
            },);
        }
        return checkLeaveExistsData;
      }
      else {
        showDialog(context: context, builder:(context) {
              return CustomErrorAlert(
            descriptions: _checkIfLeaveExistsResponse.statusMessage.toString(),
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
  // }
    
  }
}
