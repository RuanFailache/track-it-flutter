import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kFontFamilyInter = GoogleFonts
    .inter()
    .fontFamily;
final kFontFamilyFallbackInter = GoogleFonts
    .inter()
    .fontFamilyFallback;

const kColorPrimary = Color(0xFF220859);
const kColorSecondary = Color(0xFFDB2EF2);
const kColorBackground = Color(0xFFFFFFFF);
const kColorSurface = Color(0xFFF7F7F7);
const kColorDisabled = Color(0xFF979797);

final appTheme = ThemeData(
  disabledColor: kColorDisabled,
  scaffoldBackgroundColor: kColorBackground,
  splashColor: kColorPrimary.withOpacity(.3),
  highlightColor: kColorPrimary.withOpacity(.1),
  colorScheme: const ColorScheme.light().copyWith(
    primary: kColorPrimary,
    secondary: kColorSecondary,
  ),
  fontFamily: kFontFamilyInter,
  fontFamilyFallback: kFontFamilyFallbackInter,
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
    foregroundColor: kColorPrimary,
    backgroundColor: Colors.transparent,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kColorSurface,
    hintStyle: GoogleFonts.inter(
      fontSize: 16,
      height: 1,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.zero,
    ),
    contentPadding: const EdgeInsets.symmetric(
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
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        height: 1,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      disabledForegroundColor: kColorDisabled,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      textStyle: GoogleFonts.inter(
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
