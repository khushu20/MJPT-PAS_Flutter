import 'dart:core';

class ApiConstants {
  ApiConstants._();
  /* static const weather_Url = 'http://api.openweathermap.org/data/2.5/weather?';
  static const forecast_Url =
      'http://api.openweathermap.org/data/2.5/forecast?'; */
  static const String baseUrlHRMS = demoUrl;

  static const String demoUrl =
      "http://demo11.cgg.gov.in/cmnwebservicesmobile/attwsapi/";
  static const String qaUrl =
      "https://qa11.cgg.gov.in/cmnwebservicesmobile/attwsapi/";

  static const String endpoint_login_mobile = "login";
  static const String endpoint_validateMpin = "validatemPin";
  static const String endpoint_getmPin = "getmPin";
  static const String endpoint_leave = "Leave";
  static const String endpoint_leave_time_zone = "LeaveTimeZone";
  // static const String endpoint_login_mobile = "login";
  // static const String endpoint_login_mobile = "login";
}
