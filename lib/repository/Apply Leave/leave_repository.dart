import 'package:flutter/material.dart';
import 'package:mjpt_pas/model/login_mobile_payload.dart';
import 'package:mjpt_pas/model/login_mobile_response.dart';

import '../../data/base_api_client.dart';
import '../../model/leave_payload.dart';
import '../../model/leave_response.dart';
import '../../res/constants/api_constants.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class LeaveRepository {
  final _baseClient = BaseApiClient();
  Future<LeaveResponse> leave(LeavePayload payload, String? bearerToken) async {
    final response = await _baseClient.postAuthorizationCall(
        ApiConstants.endpoint_leave, payload.toJson(),BearerToken: bearerToken);
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
      return LeaveResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {
      print("throw")
      };
  }
}