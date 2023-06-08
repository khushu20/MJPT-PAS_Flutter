import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreHelper {
  writeTheData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  }

  Future<dynamic> readTheData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  deleteTheData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clearTheData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> saveColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color', color.value);
  }

  Future<Color> readColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int colorValue = prefs.getInt('color') ?? Colors.blue.value;
    return Color(colorValue);
  }
}
