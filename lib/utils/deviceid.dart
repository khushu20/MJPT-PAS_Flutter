import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class Utils {
  Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }

  Future<String?> getDeviceType() async {
    if (Platform.isIOS) {
      return "IOS";
    } else if (Platform.isAndroid) {
      return "ANDROID";
    }
    return null;
  }
}
