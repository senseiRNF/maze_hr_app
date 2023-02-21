import 'package:flutter/material.dart';

class GlobalString {
  static const String appName = 'Maze HR App';
  static const String versionNumber = '1.0.0';
}

class GlobalTextStyle {
  static TextStyle defaultStyle = const TextStyle(
    color: Colors.black54,
    fontSize: 16.0,
  );

  static TextStyle headingStyle = const TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitleStyle = const TextStyle(
    color: Colors.black54,
    fontSize: 14.0,
  );

  static TextStyle dialogTitle = const TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dialogContent = const TextStyle(
    color: Colors.black54,
    fontSize: 14.0,
  );
}