import 'package:flutter/material.dart';

final appTheme = ThemeData(
    splashColor: Colors.blueAccent.withOpacity(.3),
    highlightColor: Colors.blueAccent.withOpacity(.1),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.blueAccent,
      secondary: Colors.yellow,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.blueAccent,
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      hintStyle: TextStyle(
        fontSize: 16,
        height: 1,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.zero,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
    ));
