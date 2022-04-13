//theme_model.dart
import 'package:flutter/material.dart';
import '../preference/counterPreference.dart';
import '../preference/themePreference.dart';

class PreferencesModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _themePreference;
  bool get isDark => _isDark;

  PreferencesModel() {
    _isDark = false;
    _themePreference = ThemePreferences();
    getPreferences();
    _count = 0;
    _countPreference = CounterPreference();
    getPreferencesCount();
  }


  set isDark(bool value) {
    _isDark = value;
    _themePreference.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _themePreference.getTheme();
    notifyListeners();
  }

  late int _count;
  late CounterPreference _countPreference;
  int get count => _count;



  set count(int value) {
    _count = value;
    _countPreference.setCounter(value);
    notifyListeners();
  }

  getPreferencesCount() async {
    _count = await _countPreference.getCounter();
    notifyListeners();
  }
}
