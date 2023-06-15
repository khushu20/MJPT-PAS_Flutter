import 'package:flutter/material.dart';
import 'package:mjpt_pas/model/login_mobile_payload.dart';
import 'package:mjpt_pas/model/login_mobile_response.dart';

import '../data/base_api_client.dart';
import '../res/constants/api_constants.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class LoginMobileRepository {
  final _baseClient = baseApiClient();
  Future<LoginMobileResponse> loginMobile(LoginMobilePayload payload) async {
    final response = await _baseClient.postCall(
        ApiConstants.endpoint_login_mobile, payload.toJson());
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
      return LoginMobileResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {
      print("throw")
      };
  }
}