import 'package:flutter/material.dart';

class AppTheme {
  static const Color ink = Color(0xFF111111);
  static const Color muted = Color(0xFF6B6B6B);
  static const Color border = Color(0xFFE7E7E7);
  static const Color page = Color(0xFFFFFFFF);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: page,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ink,
        brightness: Brightness.light,
      ),
      fontFamily: 'Georgia',
      appBarTheme: const AppBarTheme(
        backgroundColor: page,
        foregroundColor: ink,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: border,
    );
  }
}
