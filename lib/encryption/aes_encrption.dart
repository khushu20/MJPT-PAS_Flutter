import 'package:encrypt/encrypt.dart' as encrypt;

import '../res/string_constants/string_constants.dart';
class AesEncription{
  String encryption(String plainText) {
    final key = encrypt.Key.fromUtf8(AppStrings.ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return encrypted.base64;
  }

  String decryption(String encryptedText) {
    final key = encrypt.Key.fromUtf8(AppStrings.ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypt.Encrypted.fromBase64(encryptedText);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}