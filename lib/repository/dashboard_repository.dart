import 'package:flutter/material.dart';
import 'package:mjpt_pas/model/dashboard_menu_payload.dart';
import 'package:mjpt_pas/model/dashboard_menu_response.dart';

import '../data/base_api_client.dart';

import '../res/constants/api_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DashboardRepository {
  final _baseClient = BaseApiClient();
  Future<DashboardMenuResponse> callDashboardMenuList(
      DashboardMenuPayload payload, String? bearerToken) async {
    final response = await _baseClient.postAuthorizationCall(
        ApiConstants.endpoint_dashboard, payload.toJson(),
        BearerToken: bearerToken);
    if (response == null) {
      showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentContext!,
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
      return DashboardMenuResponse.fromJson(response as Map<String, dynamic>);
    }
    throw {print("throw")};
  }
}
