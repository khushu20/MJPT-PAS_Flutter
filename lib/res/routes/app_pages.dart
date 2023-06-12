
import 'package:flutter/cupertino.dart';
import 'package:mjpt_pas/view/login_mobile.dart';
import '../../view/login.dart';
import 'App_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.LogIn: ((context) => LogIn()), 
      AppRoutes.LoginMobile: ((context) => LoginMobile()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
    };
  }
}
