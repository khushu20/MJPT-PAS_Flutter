import 'package:flutter/material.dart';
import 'package:mjpt_pas/model/validate_mpin_response.dart';

import '../data/base_api_client.dart';
import '../model/update_mpin_payload.dart';
import '../model/update_mpin_response.dart';
import '../model/validate_mpin_payload.dart';
import '../res/constants/api_constants.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class ValidateMpinRepository{
 final _baseClient = BaseApiClient(); 
 Future<ValidateMpinResponse> validateMpin(ValidateMpinPayload payload, String ? bearerToken) async {
    final response = await _baseClient.postAuthorizationCall(
        ApiConstants.endpoint_validateMpin, payload.toJson(), BearerToken: bearerToken);
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
      return ValidateMpinResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {
      print("throw")
      };
  }

  Future<UpdateMpinResponse> ForgotMpin(UpdateMpinPayload payload, String bearerToken) async {
    final response = await _baseClient.postAuthorizationCall(
        ApiConstants.endpoint_getmPin, payload.toJson(), BearerToken: bearerToken);
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
      return UpdateMpinResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {
      print("throw")
      };
  }
}