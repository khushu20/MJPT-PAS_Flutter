
import 'package:flutter/cupertino.dart';

import '../../view/login.dart';
import 'App_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.LogIn: ((context) => LogIn()), 
    };
  }
}
