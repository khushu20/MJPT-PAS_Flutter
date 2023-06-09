/* 
import 'package:flutter/material.dart';

import 'package:my_ghmc/data/base_api_client.dart';
import 'package:my_ghmc/model/versioncheck_request.dart';
import 'package:my_ghmc/model/versioncheck_response.dart';
import 'package:my_ghmc/res/constants/api_constants.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SplashRepository {
  final _baseClient = baseApiClient();
  Future<VersionCheckResponse> AndroidversionCheck(VersionCheckRequest payload) async {
    final response = await _baseClient.postCall(
        ApiConstants.Endpoint_versioncheck_Android, payload.toJson());
    if (response == null) {
      showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentContext !,
        builder: (BuildContext context) => AlertDialog(
          //  title: Text(AppStrings.Logout_title),
          content: Text("Server not responding"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      );
      print("Null is returning");
    } else {
      return VersionCheckResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {print("throw")};
  }

  Future<VersionCheckResponse> IOSversionCheck(VersionCheckRequest payload) async {
    final response = await _baseClient.postCall(
        ApiConstants.Endpoint_versioncheck_IOS, payload.toJson());
    if (response == null) {
      showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentContext !,
        builder: (BuildContext context) => AlertDialog(
          //  title: Text(AppStrings.Logout_title),
          content: Text("Server not responding"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      );
      print("Null is returning");
    } else {
      return VersionCheckResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {print("throw")};
  }
}
 */