import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Color(0xff0066FF),
      secondary: Colors.green,
      onSecondary: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black),
  iconTheme: const IconThemeData(
    color: Color(0xff0066FF),
  ),
);
