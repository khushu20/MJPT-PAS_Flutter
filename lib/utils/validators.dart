/* import 'package:flutter/material.dart';
import 'package:my_ghmc/View/logIn.dart';
import 'package:my_ghmc/utils/regex.dart';

import '../res/TextConstants/stringConstants.dart';
import '../res/components/CustomAlerts/customAlerts.dart';
import '../res/constants/image_constants.dart';



class app_validators {
  log_in_validator(name, mobile, context) {
    if (name.toString().isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: AppStrings.LoginAlert_nametitle,
              descriptions: AppStrings.LoginAlert_name,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          });
      return false;
    } else if (mobile.toString().isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: AppStrings.LoginAlert_mobiletitle,
              descriptions: AppStrings.LoginAlert_enterMobile,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          });
      return false;
    } else if (mobile.toString().length < 10) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: AppStrings.LoginAlert_mobileLength,
              descriptions: AppStrings.LoginAlert_InvalidMobile,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          });
      return false;
    }
    else if (!RegExp(regex.mobile_regex).hasMatch(mobile.toString())) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: AppStrings.LoginAlert_mobileStart,
              descriptions: AppStrings.LoginAlert_Invalid,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          });
      return false;
    } else {
      return true;
    }
  }
}
/*validateInputs() {
    if (_mobileNumber.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Mobile Number cannot be empty",
              descriptions: AppStrings.LoginAlert_enterMobile,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          });
      return false;
    } else if (_mobileNumber.text.length < 10) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "MOBILE NUMBER ",
              descriptions: AppStrings.LoginAlert_Invalid,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          });
      return false;
    } /* else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(_password.text)) {
      showAlert("Please Enter a Valid Password");
    } */
    //[6-9]{1}[0-9]{9}
    else if(!RegExp(r'^([6-9]{1})([0-9]{9})$').hasMatch(_mobileNumber.text)){
     showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "MOBILE NUMBER INVALID",
              descriptions: AppStrings.LoginAlert_Invalid,
              Buttontext: AppStrings.MyGHMC_Ok,
              img: Image.asset(AssetPath.WarningBlueIcon),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          });
      return false;
    }
    else {
      return true;
    }
  }*/ */