import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkModeProvider = StateNotifierProvider<DarkModeProvider, bool>((ref) {
  return DarkModeProvider(ref.read);
});

class DarkModeProvider extends StateNotifier<bool> {
  DarkModeProvider(this.read, [state]) : super(state ?? false) {
    _init();
  }

  final Reader read;

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = false;
    var jsonData = prefs.getString('darkMode') ?? '';
    if (jsonData != '') {
      darkMode = json.decode(jsonData)['mode'];
    }
    state = darkMode;
  }

  Future<void> switchDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = !state;
    prefs.setString('darkMode', jsonEncode({'mode': state}));
    state = state;
  }
}
