import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF9F7FC),
    );
  }

  // Dark Theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF0A0713),
    );
  }

  // Gradient helper for backgrounds
  static LinearGradient getBackgroundGradient(bool isDark) {
    return isDark
        ? const LinearGradient(
            colors: [Color(0xFF0A0713), Color(0xFF1B1235)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [Color(0xFFF3E7FC), Color(0xFFE3F2FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );
  }
}
