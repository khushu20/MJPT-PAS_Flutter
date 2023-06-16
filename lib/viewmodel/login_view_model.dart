

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mjpt_pas/encryption/aes_encrption.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../res/Routes/App_routes.dart';
import '../res/components/reusable widgets/app_toast.dart';

class LoginViewModel with ChangeNotifier {
  final ENCRYPTION_KEY = "bXVzdGJlMTZieXRlc2tleQ==";
  LoginValidation(String username, String password, context) async {
    if (username.isEmpty) {
      AppToast().showToast(AppStrings.username_empty);
    } else if (password.isEmpty) {
      AppToast().showToast(AppStrings.password_empty);
    } else {
      /* String en_pass = encryption(password);
      String en_user = encryption(username);
      String dec_pass = decryption(password);
      String dec_user = decryption(username); */
      //LoginViewModel viewModel = LoginViewModel(); // Create an instance
      String en_pass = AesEncription().encryption(password);
      String en_user = AesEncription().encryption(username);
      String dec_pass = AesEncription().decryption(en_pass);
      String dec_user = AesEncription().decryption(en_user);
      print("encrypted password: " + en_pass);
      print("encrypted username: " + en_user);
      print("decrypted password: " + dec_pass);
      print("decrypted username: " + dec_user);
      //Navigator.pushReplacementNamed(context, AppRoutes.validateMpin);
    }
  }

}
