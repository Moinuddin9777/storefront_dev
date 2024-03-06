import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/themes/colorscheme.dart';

class Controller extends GetxController {
  ThemeMode mode = ThemeMode.system;

  ThemeData themeLight = ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.primary,
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        )),
    iconTheme: IconThemeData(color: kColorScheme.onPrimary),
  );

  ThemeData themeDark = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: darkColorScheme.onPrimaryContainer,
        foregroundColor: darkColorScheme.primaryContainer),
    cardTheme: const CardTheme().copyWith(
      color: darkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primaryContainer,
        foregroundColor: darkColorScheme.onPrimaryContainer,
      ),
    ),
  );
}
