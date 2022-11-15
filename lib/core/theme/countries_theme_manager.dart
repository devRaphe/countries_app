import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// This class is used to define the app theme.
class CountriesThemeManager {
  CountriesThemeManager._();

  /// Light theme data
  static ThemeData darkTheme = _themeData(_darkColorScheme);

  /// Dark theme data
  static ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData _themeData(ColorScheme colorScheme) => ThemeData(
        brightness: colorScheme.brightness,
        scaffoldBackgroundColor: colorScheme.background,
        colorScheme: colorScheme,
        textTheme: GoogleFonts.montserratTextTheme(_textTheme(colorScheme)),
        appBarTheme: _appBarTheme(colorScheme),
      );

  static final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
    primary: Colors.white,
    primaryContainer: const Color(0XFFff6c00),
    secondary: const Color(0xFF98a2b3),
    secondaryContainer: const Color(0xff1e2c41),
    background: const Color(0XFF000f24),
    surfaceTint: const Color(0xFF001637),
    surface: Colors.white,
  );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: Colors.black,
    primaryContainer: const Color(0XFFff6c00),
    secondary: const Color(0xff98a2b3),
    secondaryContainer: const Color(0xfff2f4f7),
    background: Colors.white,
    surfaceTint: const Color(0xFF001637),
    surface: Colors.black,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline1: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: colorScheme.surface,
          height: 1.5,
        ),
        headline2: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        headline3: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        button: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        bodyText1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.surface,
          height: 1.5,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.surface,
          height: 1.5,
        ),
      );

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        backgroundColor: colorScheme.background,
        centerTitle: true,
        iconTheme: _iconTheme(colorScheme),
      );
  static IconThemeData _iconTheme(ColorScheme colorScheme) => IconThemeData(
        color: colorScheme.surface,
      );
}
