import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFFB39DDB);
  static const Color lightBackground = Color(0xFFF7F4FB);
  static const Color darkBackground = Color(0xFF1E1B24);
  static const Color softPink = Color(0xFFF8D7DA);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}