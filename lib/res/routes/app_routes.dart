
import 'package:mjpt_pas/view/set_mpin.dart';
import 'package:mjpt_pas/view/validate_mpin.dart';
import 'package:mjpt_pas/view/validate_otp.dart';

class AppRoutes {
  AppRoutes._();
  static const initial = ValidateOtp;
  static const Login = "/Login";
  static const LoginMobile = "/LoginMobile";
  static const ValidateMpin = "/ValidateMpin";
  static const SetMpin = "/SetMpin";
  static const ValidateOtp = "/ValidateOtp";
  //static const Dashboard = "/Dashboard";
  //static const Dashboard = "/Dashboard";
  //static const Dashboard = "/Dashboard";
}
