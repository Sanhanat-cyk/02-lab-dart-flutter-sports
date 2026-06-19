// lib/providers/locale_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? langCode = prefs.getString('language_code');
    if (langCode != null && langCode.isNotEmpty) {
      _locale = Locale(langCode);
    } else {
      _locale = null;
    }
    notifyListeners(); // <<<<<<<<<< ต้องมี
  }

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;

    _locale = newLocale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
    notifyListeners(); // <<<<<<<<<< ต้องมี
  }

  Future<void> clearLocale() async {
    if (_locale == null) return;

    _locale = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('language_code');
    notifyListeners(); // <<<<<<<<<< ต้องมี
  }
}
