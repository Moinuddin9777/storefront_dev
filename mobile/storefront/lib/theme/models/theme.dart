import "package:flutter/material.dart";
import "package:storefront/theme/models/theme_consts.dart";

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: darkThemeColor,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: lightThemeColor,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
  );
}
