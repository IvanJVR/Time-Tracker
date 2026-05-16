import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    textTheme: const TextTheme(
      //Para títulos
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(),

      //Para texto común
      bodyMedium: TextStyle(),

      //Para etiquetas
      labelLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );
}
