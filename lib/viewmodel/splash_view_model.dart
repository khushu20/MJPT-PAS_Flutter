/* import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:my_ghmc/model/versioncheck_request.dart';
import 'package:my_ghmc/data/base_api_client.dart';
import 'package:my_ghmc/data/localStoreHelper.dart';
import 'package:my_ghmc/repository/splash_repository.dart';
import 'package:my_ghmc/res/Routes/App_routes.dart';
import 'package:my_ghmc/res/TextConstants/stringConstants.dart';
import 'package:my_ghmc/res/constants/shared_pref_consts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../res/constants/app_constants.dart';

class SplashViewModel with ChangeNotifier {
  final _splashRepository = SplashRepository();

  versionCheck(String userid, String password, BuildContext context) async {
    if (Platform.isAndroid) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String Appversion = packageInfo.version;
      print("app version" + Appversion);
      LocalStoreHelper()
          .writeTheData(SharedPrefConstants.versionNum, Appversion);
      final versionCheckPayload = VersionCheckRequest(
          userid: AppStrings.versioncheck_userid,
          password: AppStrings.versioncheck_password);
      try {
        final result =
            await _splashRepository.AndroidversionCheck(versionCheckPayload);
        String version = result.tag ?? '';
        double? databaseVersion = double.tryParse(version);
        print("database version ${result.tag}");
        if (result.status == apiErrorCodes.success_true) {
          String? Username =
              await LocalStoreHelper().readTheData(SharedPrefConstants.name);
          print(Username);
          await _requestPermissions();
          if (Appversion == result.tag ||
              double.tryParse(Appversion)! > databaseVersion!) {
            if (Username == 'name' || Username == null) {
              Navigator.pushReplacementNamed(context, AppRoutes.login_view);
            } else {
              Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
            }

            getIp();
            getPackageName();

            // GoRouter.of(context).go(RoutesList.login);
            print(Appversion);
            print(result.tag);
            print("Success");
          } else {
            Fluttertoast.showToast(
                msg: 'Update the App',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black); 
          }
          notifyListeners();
        } else if (result.status == apiErrorCodes.status_false) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              //  title: const Text(AppStrings.Logout_title),
              content: Text(result.message.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: const Text(AppStrings.MyGHMC_Ok),
                  ),
                ),
              ],
            ),
          );
        }
      } on DioError catch (e) {
        Fluttertoast.showToast(
            msg: '${e.message}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black);
      }
    } else if (Platform.isIOS) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String Appversion = packageInfo.version;
      LocalStoreHelper()
          .writeTheData(SharedPrefConstants.versionNum, Appversion);
      final versionCheckPayload = VersionCheckRequest(
          userid: AppStrings.versioncheck_userid,
          password: AppStrings.versioncheck_password);
      try {
        final result =
            await _splashRepository.IOSversionCheck(versionCheckPayload);
        String version = result.version ?? '';
        double? databaseVersion = double.tryParse(version);
        print("database version ${result.version}");
        if (result.status == apiErrorCodes.success_true) {
          String? Username =
              await LocalStoreHelper().readTheData(SharedPrefConstants.name);
          print(Username);
          await _requestPermissions();
          if (Appversion == result.tag ||
              double.tryParse(Appversion)! > databaseVersion!) {
            if (Username == 'name' || Username == null) {
              Navigator.pushReplacementNamed(context, AppRoutes.login_view);
            } else {
              Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
            }

            getIp();
            getPackageName();

            // GoRouter.of(context).go(RoutesList.login);
            print(Appversion);
            print(result.tag);
            print("Success");
          } else {
            Fluttertoast.showToast(
                msg: 'Update the App',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black);
          }
          notifyListeners();
        } else if (result.status == apiErrorCodes.status_false) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              //  title: const Text(AppStrings.Logout_title),
              content: Text(result.message.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: const Text(AppStrings.MyGHMC_Ok),
                  ),
                ),
              ],
            ),
          );
        }
      } on DioError catch (e) {
        Fluttertoast.showToast(
            msg: '${e.message}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black);
      }
    }
  }

  void getIp() async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      print("hvgvghv" + data.toString());
      AppConstants.device_ip = data.toString();
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      print(exception.message);
    }
  }

  Future<void> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    AppConstants.package_name = packageName;
    print(
        "package name is $packageName"); // This will print the package name of your app
  }

  Future<void> _requestPermissions() async {
    // Request camera permission
    await Permission.camera.request();

    // Request gallery permission
    await Permission.photos.request();

    // Request location permission
    await Permission.location.request();

    // Request storage permission
    await Permission.storage.request();

    // Navigate to your next screen
    //Navigator.pushReplacementNamed(context, AppRoutes.login_view);
  }
}
 */