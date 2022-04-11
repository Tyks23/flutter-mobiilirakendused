import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPreference {
  static const PREF_KEY = "counter_key";

  setCounter(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(PREF_KEY, value);
  }

  getCounter() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(PREF_KEY) ?? false;
  }
}