
import 'package:flutter/cupertino.dart';
import 'package:mjpt_pas/view/apply_leave.dart';
import 'package:mjpt_pas/view/grievance_report.dart';
import 'package:mjpt_pas/view/leave_report.dart';
import 'package:mjpt_pas/view/login_mobile.dart';
import 'package:mjpt_pas/view/pay_slip.dart';
import 'package:mjpt_pas/view/raise_grievance.dart';
import 'package:mjpt_pas/view/validate_otp.dart';
import '../../view/attendance.dart';
import '../../view/login.dart';
import '../../view/set_mpin.dart';
import '../../view/validate_mpin.dart';
import 'App_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.login: ((context) => Login()), 
      AppRoutes.loginMobile: ((context) => LoginMobile()), 
      AppRoutes.validateMpin: ((context) => ValidateMpin()), 
      AppRoutes.setMpin: ((context) => SetMpin()), 
      AppRoutes.validateOtp: ((context) => ValidateOtp()), 
      AppRoutes.Attendance: ((context) => Attendance()), 
      AppRoutes.ApplyLeave: ((context) => ApplyLeave()), 
      AppRoutes.RaiseGrievance: ((context) => RaiseGrievance()), 
      AppRoutes.LeaveReport: ((context) => LeaveReport()), 
      AppRoutes.GrievanceReport: ((context) => GrievanceReport()),
      AppRoutes.PaySlip: ((context) => PaySlip()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()), 
      // AppRoutes.LogIn: ((context) => LogIn()),  
    };
  }
}
