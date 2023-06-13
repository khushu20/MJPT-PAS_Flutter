import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mjpt_pas/res/string_constants/string_constants.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import '../res/Routes/App_routes.dart';

class LoginMobileViewModel with ChangeNotifier {
final ENCRYPTION_KEY = "bXVzdGJlMTZieXRlc2tleQ==";
  LoginMobileValidation(String mobileNumber, context) async {
    if (mobileNumber.isEmpty) {
      Fluttertoast.showToast(
          msg: AppStrings.mobilenumber_empty,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if(mobileNumber.length != 10) {
      Fluttertoast.showToast(
          msg: AppStrings.mobilenumber_invalid,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (!RegExp(r'^([6-9]{1})([0-9]{9})$').hasMatch(mobileNumber)) {
      Fluttertoast.showToast(
          msg: AppStrings.mobilenumber_invalid,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else {
      LoginMobileViewModel viewModel = LoginMobileViewModel(); 
      String en_mobile = viewModel.encryption(mobileNumber);
      String dec_mobile = viewModel.decryption(en_mobile);
      print("encrypted mobile: " + en_mobile.length.toString());
      print("decrypted mobile: " + dec_mobile);
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