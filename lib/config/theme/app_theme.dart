


import 'package:flutter/material.dart';

class AppTheme {


  ThemeData getTheme() => ThemeData(
    brightness: ThemeData.dark().brightness,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF2862F5)
  );


}