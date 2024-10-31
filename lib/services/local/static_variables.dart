import 'package:flutter/material.dart';

/// Static Variables
///
/// This class serve as a provider whenever we need to get an easy static variables
class StaticVariables {
  static String appName = "Maze HR App";
  static String versionNumber = "1.0.0";

  static String imageAssetPath = "assets/images";

  static final Color _primaryColor = const Color(0xff00afff);
  static final Color _secondaryColor = const Color(0xffc6edff);

  static ColorScheme customColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _secondaryColor,
    onSecondary: _primaryColor,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static InputDecorationTheme customInputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true,
    fillColor: Colors.white,
  );
}