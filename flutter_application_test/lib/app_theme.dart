// app_theme.dart
import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get fontGray => const Color.fromARGB(255, 128, 128, 128);
  Color get font => const Color.fromARGB(255, 7, 18, 32);
  Color get fontContrast => const Color.fromARGB(255, 255, 255, 255);
  Color get contrast => const Color.fromARGB(255, 0, 0, 0);
  Color get primary => const Color.fromARGB(255, 249, 249, 249); // Blanc ou gris très clair
  Color get secondary => const Color.fromARGB(255, 235, 236, 233);
  Color get tertiary => const Color.fromARGB(255, 191, 191, 191);
  Color get field => const Color.fromARGB(255, 255, 255, 255);
  Color get error => const Color.fromARGB(255, 238, 27, 21);
  Color get success => const Color.fromARGB(255, 77, 171, 154);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: const Color.fromARGB(255, 249, 249, 249), // Blanc ou gris très clair
        onPrimary: Colors.black,
        secondary: const Color.fromARGB(255, 235, 236, 233),
        onSecondary: Colors.black,
        error: const Color.fromARGB(255, 238, 27, 21),
        onError: Colors.white,
        surface: const Color.fromARGB(255, 191, 191, 191),
        onSurface: Colors.black,
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          fontFamily: 'WorkSans',// Utilisez WorkSans pour ce style
        ),

        titleLarge: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: 'WorkSans', // Utilisez WorkSans pour ce style
        ),

        bodyMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'WorkSans', // Utilisez WorkSans pour ce style
        ),

        displaySmall: const TextStyle(
          fontSize: 18,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.w600,
        ),

        bodySmall: const TextStyle(
          fontSize: 14,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
