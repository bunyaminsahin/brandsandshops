import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
        isDarkTheme ? const Color(0xff00000a) : const Color(0xFFFFFFFF),
      primaryColor: Colors.black,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: //0xFF1a1f3c
          isDarkTheme ? Colors.deepPurple : const Color(0xFFE8FDFD),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor:
        isDarkTheme ? const Color(0xff02030a) : const Color(0xFFF2FDFD),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme
            ? const ColorScheme.dark()
            : const ColorScheme.light()),
    );
  }
}