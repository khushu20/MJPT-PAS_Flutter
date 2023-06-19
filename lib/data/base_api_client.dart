

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../res/constants/api_constants.dart';



class BaseApiClient {
  late final Dio _client = Dio(
    BaseOptions(baseUrl: ApiConstants.baseUrlHRMS),
  );
 

  Future<dynamic> postCall(String url, Map<String, dynamic> payload,
      {String contenType = "application/json",}) async {
    try {
      final response = await _client.post(
        url,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
        }),
      );
      print(response.data);
      print("payload $payload");
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
      print('error');
    }
  }

  Future<dynamic> postAuthorizationCall(String url, Map<String, dynamic> payload, 
      {String contenType = "application/json", String? BearerToken,}) async {
    try {
      final response = await _client.post(
        url,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
          'Authorization': BearerToken,
        }),
      );
      print(response.data);
      print("postAuthorizationCall payload $payload");
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
      print('error');
    }
  }


  
}
