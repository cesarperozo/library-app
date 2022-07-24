import 'package:flutter/material.dart';
// ignore: library_prefixes

class AppTheme {
  static const Color primary = Color(0xFF0284c7);
  static const Color secondary = Color(0xFF0886ff);
  static const Color baseColor = Color(0xfff3f4f6);
  static const Color disabledColor = Color(0xFF888888);
  static const Color backgroundColor = Color(0xfff9fafb);
  static const Color textColor = Color(0xff1f2937);
  static const Color backgroundInput = Color(0xFF0284c7);

  static ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: primary,
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      // TextButton Theme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: disabledColor,
        backgroundColor: baseColor,
      ),
      scaffoldBackgroundColor: backgroundColor,

      // FloatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),

      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          primary: primary,
          shape: const StadiumBorder(),
          elevation: 60,
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        helperStyle: TextStyle(
          color: textColor,
        ),
        hintStyle: TextStyle(
          color: textColor,
        ),
        labelStyle: TextStyle(
          color: textColor,
        ),
        floatingLabelStyle: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: textColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: disabledColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
