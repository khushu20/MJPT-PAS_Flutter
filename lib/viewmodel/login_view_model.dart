import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';

import '../res/Routes/App_routes.dart';

class LoginViewModel with ChangeNotifier {
  final ENCRYPTION_KEY = "bXVzdGJlMTZieXRlc2tleQ==";
  LoginValidation(String username, String password, context) async {
    if (username.isEmpty) {
      Fluttertoast.showToast(
          msg: AppStrings.username_empty,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: AppStrings.password_empty,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      /* String en_pass = encryption(password);
      String en_user = encryption(username);
      String dec_pass = decryption(password);
      String dec_user = decryption(username); */
      LoginViewModel viewModel = LoginViewModel(); // Create an instance
      String en_pass = viewModel.encryption(password);
      String en_user = viewModel.encryption(username);
      String dec_pass = viewModel.decryption(en_pass);
      String dec_user = viewModel.decryption(en_user);
      print("encrypted password: " + en_pass);
      print("encrypted username: " + en_user);
      print("decrypted password: " + dec_pass);
      print("decrypted username: " + dec_user);
      //Navigator.pushReplacementNamed(context, AppRoutes.validateMpin);
    }
  }

  
  String encryption(String plainText) {
    final key = encrypt.Key.fromUtf8(ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return encrypted.base64;
  }

  String decryption(String encryptedText) {
    final key = encrypt.Key.fromUtf8(ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypt.Encrypted.fromBase64(encryptedText);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
