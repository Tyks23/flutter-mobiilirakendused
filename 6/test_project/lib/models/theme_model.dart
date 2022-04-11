//theme_model.dart
import 'package:flutter/material.dart';
import '../preference/counterPreference.dart';
import '../preference/themePreference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
    _count = 0;
    _preferences2 = CounterPreference();
    getPreferencesCount();
  }
//Switching themes in the flutter apps - Flutterant
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  late int _count;
  late CounterPreference _preferences2;
  int get count => _count;


//Switching themes in the flutter apps - Flutterant
  set count(int value) {
    _count = value;
    _preferences2.setCounter(value);
    notifyListeners();
  }

  getPreferencesCount() async {
    _count = await _preferences2.getCounter();
    notifyListeners();
  }
}
//Switching themes in the flutter apps - Flutterant
