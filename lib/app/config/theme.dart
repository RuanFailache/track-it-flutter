import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  splashColor: const Color(0xFF220859).withOpacity(.3),
  highlightColor: const Color(0xFF220859).withOpacity(.1),
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFF220859),
    secondary: const Color(0xFFDB2EF2),
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  fontFamilyFallback: GoogleFonts.inter().fontFamilyFallback,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.passionOne(
      fontSize: 72,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 16,
      height: 1,
      fontWeight: FontWeight.w500,
    ),
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
  ),
);
