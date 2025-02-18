import 'package:bringr/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppPalette.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27.0),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.primaryColor),
      errorBorder: _border(AppPalette.warningColor),
    ),
  );
}
