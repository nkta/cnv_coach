import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF0F8FF), // Alice Blue
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFA9D1A9), // Pastel Green
      secondary: Color(0xFFD2B48C), // Tan/Beige
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      surface: Colors.white,
      onSurface: Color(0xFF4682B4), // Steel Blue for text
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF0F8FF),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF4682B4),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF4682B4),
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA9D1A9),
        foregroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF4682B4),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    useMaterial3: true,
  );
}
