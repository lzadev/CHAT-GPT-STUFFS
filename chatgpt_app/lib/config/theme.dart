import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      colorSchemeSeed: const Color.fromRGBO(59, 219, 158, 1),
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }
}
