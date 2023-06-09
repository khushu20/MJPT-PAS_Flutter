/* 

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class baseApiClient {
  late final Dio _client = Dio(
    BaseOptions(/* baseUrl: ApiConstants.baseUrlMyGHMC */),
  );
  late final Dio client = Dio(
    BaseOptions(/* baseUrl: ApiConstants.baseUrlPetTypeMyGHMC */),
  );
  /* late final Dio weatherclient = Dio(
    BaseOptions(baseUrl: ApiConstants.weather_Url),
  ); */

  late final Dio weatherClient = Dio();

  late final Dio clientgetWard = Dio(
    BaseOptions(/* baseUrl: ApiConstants.baseUrlPetTypeMyGHMC */),
  );

  late final Dio CandDclient = Dio(
    BaseOptions(/* baseUrl: ApiConstants.baseUrlCandD */),
  );

  Future<dynamic> getCall(
    String url,
  ) async {
    try {
      final response = await _client.get(url);
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
    }
  }

  Future<dynamic> getPetTypeCall(String url) async {
    try {
      final response = await client.get(url);
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
    }
  }

  Future<dynamic> postCall(String url, Map<String, dynamic> payload,
      {String contenType = "application/json"}) async {
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

  Future<dynamic> CandDpostCall(String url, Map<String, dynamic> payload,
      {String contenType = "application/json"}) async {
        print(" payload in baseapi${payload}");
    try {
      final response = await CandDclient.post(
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

  Future<dynamic> CandDgetCall(
    String url,
  ) async {
    try {
      final response = await CandDclient.get(url);
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
    }
  }

  Future<dynamic> postCallGetWard(String url, Map<String, dynamic> payload,
      {String contenType = "application/json"}) async {
    try {
      final response = await clientgetWard.post(
        url,
        data: payload,
        options: Options(headers: {
          'Content-Type': contenType,
        }),
      );
      //print(response.data);
      return response.data;
    } catch (e) {
        EasyLoading.dismiss();
      print('error');
    }
  }

  Future<Map<String, dynamic>> getWeatherData(String appid1,/* {required Map<String, dynamic> queryParam} */) async {
    final url =('${ApiConstants.weather_Url}');
    final response = await weatherClient.get(url,
    queryParameters: {
      'q':'Hyderabad,India',
      'appid':appid1
    }
    );
    return response.data;
  }
  
  Future<Map<String, dynamic>> getForeCastData(String appid1,/* {required Map<String, dynamic> queryParam} */) async {
    final url =(' ${ApiConstants.forecast_Url}');
    final response = await weatherClient.get(url,
    queryParameters: {
      'q':'Hyderabad,India',
      'appid':appid1
    }
    );
    return response.data;
  }
}
 */