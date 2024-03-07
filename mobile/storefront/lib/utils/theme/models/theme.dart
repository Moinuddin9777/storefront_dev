import "package:flutter/material.dart";
import 'package:storefront/utils/consts/theme_consts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightThemeColor,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: lightThemeColor,
    ),
    cardTheme: const CardTheme(color: lightThemeCard),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkThemeColor,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: darkThemeColor,
    ),
    cardTheme: const CardTheme(color: darkThemeCard),
  );
}
