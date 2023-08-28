import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:flutter/cupertino.dart';

class DarkThemeProvider with ChangeNotifier{
  DarkThemePref darkThemePrefs = DarkThemePref();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme (bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}