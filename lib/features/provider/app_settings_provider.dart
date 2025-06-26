import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider with ChangeNotifier {
  String _language = 'en';
  bool _isLoading = true;

  String get language => _language;
  bool get isLoading => _isLoading;

  bool isDarkMode = false; // ← هنا نضيف الافتراضي

  AppSettingsProvider() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('app_language') ?? 'en';
    isDarkMode = prefs.getBool('is_dark_mode') ?? false; // ← استرجاع الثيم

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLanguage(String lang) async {
    _language = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_language', lang);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_mode', isDarkMode); // ← خزّن القيمة
    notifyListeners();
  }
}
