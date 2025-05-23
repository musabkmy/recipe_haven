import 'package:flutter/material.dart';

final class AppColors {
  static const MaterialColor primary = Colors.deepOrange;
  static const Color secondary = Color(0xFF286554);
  static const Color background = Color(0xFFFFFFFF);
  static Color orange = Colors.orange[800]!;
  static Color deepOrange = Colors.deepOrange;
  static Color lightOrange = Colors.orange[700]!;
  static const Color lightAmberAccent = Color(0xFFFFF7EE);

  static const Color error = Color(0xFFB00020);
  static const Color errorOnFocused = Color.fromARGB(255, 136, 0, 25);
  static const Color valid = Color.fromARGB(255, 54, 179, 143);
  static const Color transparent = Colors.transparent;

  static const Color grey50 = Color(0xFFFAFAFA); // Very light grey
  static const Color grey100 = Color(0xFFF5F5F5); // Light grey
  static const Color grey200 = Color(0xFFEEEEEE); // Slightly darker light grey
  static const Color grey300 = Color(0xFFE0E0E0); // Light grey for borders
  static const Color grey400 = Color(0xFFBDBDBD); // Medium light grey
  static const Color grey500 = Color(0xFF9E9E9E); // Medium grey
  static const Color grey600 = Color(
    0xFF757575,
  ); // Darker grey for secondary text
  static const Color grey700 = Color(0xFF616161); // Dark grey for headings
  static const Color grey800 = Color(0xFF424242); // Very dark grey
  static const Color grey900 = Color(0xFF212121); // Almost black
  static const Color lightOverlayColor = Color(0x70000000);
  static const Color mediumOverlayColor = Color.fromARGB(136, 0, 0, 0);
  const AppColors._();
}
