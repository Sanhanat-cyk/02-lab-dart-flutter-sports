// lib/providers/theme_provider.dart
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // ค่าเริ่มต้นใช้ตามระบบ

  ThemeMode get themeMode => _themeMode;

  // เมธอดสำหรับสลับโหมด
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // เมธอดสำหรับตั้งค่าโหมด (ถ้าต้องการกำหนดชัดเจน)
  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }
}
