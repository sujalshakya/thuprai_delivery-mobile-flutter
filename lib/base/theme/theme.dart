import 'package:flutter/material.dart';

class ThemeClass {
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
    inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color(0xff0066FF))),
  );

  Color getOnPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  Color getOnSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSecondary;
  }

  Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  Color getErrorColor(BuildContext context) {
    return Theme.of(context).colorScheme.error;
  }
}
