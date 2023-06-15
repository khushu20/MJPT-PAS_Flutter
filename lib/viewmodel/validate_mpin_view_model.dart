import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/encryption/aes_encrption.dart';
import 'package:mjpt_pas/model/forgot_mpin_payload.dart';
import 'package:mjpt_pas/repository/validate_mpin_repository.dart';
import 'package:mjpt_pas/res/components/reusable%20widgets/app_toast.dart';
import 'package:mjpt_pas/res/routes/app_routes.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../data/api_error_codes.dart';
import '../data/local_store_helper.dart';
import '../model/forgot_mpin_response.dart';
import '../model/validate_mpin_payload.dart';
import '../model/validate_mpin_response.dart';
import '../res/constants/shared_pref_consts.dart';

class ValidateMpinViewModel extends ChangeNotifier {
  final _validateMpinRepository = ValidateMpinRepository();
  ValidateMpinResponse response = ValidateMpinResponse();
  ForgotMpinResponse forgotMpinResponse = ForgotMpinResponse();
  String? en_enteredMpin;
  List<ValidateMpinData>? mpinData;
  mpinValidate(String enteredMpin, context) {
    if (enteredMpin.length != 4) {
      AppToast().showToast(AppStrings.mpin_length_validate);
      return false;
    } else if (enteredMpin.isEmpty) {
      AppToast().showToast(AppStrings.mpin_empty);
      return false;
    } else {
      return true;
    }
  }

  mpinMatch(String enteredMpin, String confirmMpin, int userId,
      String bearerToken, context) async {
    if (enteredMpin != confirmMpin) {
      AppToast().showToast(AppStrings.mpin_invalid);
      return false;
    } else {
      en_enteredMpin = AesEncription().encryption(enteredMpin);
      var MobNumber = await LocalStoreHelper()
          .readTheData(SharedPrefConstants.mobileNumber);

      final validateMpinPayload = ValidateMpinPayload(
          appName: AppStrings.appName,
          userModel: UserModel(
              mobileNumber: MobNumber,
              mpin: en_enteredMpin,
              userId: userId,
              userName: ""));
      try {
        response = await _validateMpinRepository.validateMpin(
            validateMpinPayload, bearerToken);
        print("status message: " + response.statusMessage.toString());
        if (response.statusMessage == ApiErrorCodes.mpin_status_Message) {
          EasyLoading.dismiss();
          if (response.data != null) {
            mpinData = response.data!;
          }
          print("mpinData: " + mpinData.toString());
          return mpinData;
        } else {
          EasyLoading.dismiss();
          AppToast().showToast(response.statusMessage.toString());
        }
      } on Exception catch (e) {
        print("Exception: " + e.toString());
      }
      return true;
    }
  }

  forgotMpin(context) async {
    /* if (enteredMpin != confirmMpin) {
      AppToast().showToast(AppStrings.mpin_invalid);
      return false;
    } 
    else { */
    int userId = await LocalStoreHelper()
        .readTheData(SharedPrefConstants.userId.toString());
    var MobNumber =
        await LocalStoreHelper().readTheData(SharedPrefConstants.mobileNumber);
    String bearerToken =
        await LocalStoreHelper().readTheData(SharedPrefConstants.bearerToken);
    final forgotMpinPayload = ForgotMpinPayload(
        appName: AppStrings.appName,
        userModel: GetMpinUserModel(
            mobileNumber: MobNumber,
            mpin: "0000",
            userId: userId,
            userName: ""));
    try {
      forgotMpinResponse = await _validateMpinRepository.ForgotMpin(
          forgotMpinPayload, bearerToken);
      print("status message: " + response.statusMessage.toString());
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        /* if (response.data != null) {
          mpinData = response.data!;
        } */
        AppToast().showToast(response.statusMessage.toString());
        //Navigator.pushNamed(context, AppRoutes.login);
        //return mpinData;
      } else {
        EasyLoading.dismiss();
        AppToast().showToast(response.statusMessage.toString());
      }
    } on Exception catch (e) {
      print("Exception: " + e.toString());
    }
    return true;
    //}
  }
}
