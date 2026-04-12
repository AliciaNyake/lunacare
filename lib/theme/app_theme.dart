import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFFB39DDB);
  static const Color lightBackground = Color(0xFFF7F4FB);
  static const Color softPink = Color(0xFFF8D7DA);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: lightBackground,
      primaryColor: primaryPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}