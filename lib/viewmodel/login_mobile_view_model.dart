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
import '../data/local_store_helper.dart';
import '../encryption/aes_encrption.dart';
import '../encryption/aes_encrption.dart';
import '../model/login_mobile_response.dart';
import '../res/Routes/App_routes.dart';
import '../res/constants/shared_pref_consts.dart';

class LoginMobileViewModel with ChangeNotifier {
  final _loginMobileRepository = LoginMobileRepository();
  final utils = Utils();
  String? device_id;
  String? device_type;
  String? en_mobile;
  String? dec_mobile;
  LoginMobileResponse response = LoginMobileResponse();
  Data? loginMobileData;

  LoginMobileValidation(String mobileNumber, context) async {
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
      en_mobile = AesEncription().encryption(mobileNumber);
      dec_mobile = AesEncription().decryption(en_mobile ?? '');
      print("encrypted mobile: " + en_mobile!);
      print("decrypted mobile: " + dec_mobile!);
      notifyListeners();
      return true;
    }
  }

  loginMobileService<Data>(context) async {
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
      response = await _loginMobileRepository.loginMobile(loginMobilePayload);
      print("status message: " + response.statusMessage.toString());
      if (response.statusMessage == ApiErrorCodes.status_Message) {
        EasyLoading.dismiss();
        if (response.data != null) {
          loginMobileData = response.data!;
          await LocalStoreHelper()
              .writeTheData(SharedPrefConstants.mPin, loginMobileData!.mpin);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.userId.toString(), loginMobileData!.userId);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.bearerToken, loginMobileData!.authToken);

          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.officeCode, loginMobileData!.officeCode);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.otpMobile, loginMobileData!.otpMobile);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.bloodGroup, loginMobileData!.bloodGroup);

          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.photoPath, loginMobileData!.photoPath);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.designation, loginMobileData!.designation);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.deviceId, loginMobileData!.deviceId);

              await LocalStoreHelper().writeTheData(
              SharedPrefConstants.email, loginMobileData!.email);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.employeeType, loginMobileData!.employeeType);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.gender, loginMobileData!.gender);

              await LocalStoreHelper().writeTheData(
              SharedPrefConstants.latitude, loginMobileData!.latitude);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.longitude, loginMobileData!.longitude);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.locationId, loginMobileData!.locationId);

              await LocalStoreHelper().writeTheData(
              SharedPrefConstants.radius, loginMobileData!.radius);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.sessionToken, loginMobileData!.sessionToken);
          await LocalStoreHelper().writeTheData(
              SharedPrefConstants.roleId, loginMobileData!.roleId);
             
        }

        //Navigator.pushReplacementNamed(context, AppRoutes.validateMpin);
        return loginMobileData;
      } else {
        EasyLoading.dismiss();
        AppToast().showToast(response.statusMessage.toString());
      }
    } on Exception catch (e) {
      print("Exception: " + e.toString());
    }
  }
}
