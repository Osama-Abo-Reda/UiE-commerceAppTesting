import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';

// Light Mode Theme
ThemeData lightTheme = ThemeData(
  primarySwatch: buildMaterialColor(const Color(0xFFFF725E)),
  primaryColor: defaultColor,
  appBarTheme: AppBarTheme(
    backgroundColor: defaultColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
    foregroundColor: Colors.white,
  ),
  dividerColor: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
);

// Dark Mode Theme
ThemeData darkTheme = ThemeData(
  primaryColor: defaultColor,
  appBarTheme: AppBarTheme(
    backgroundColor: defaultColor,
  ),
  scaffoldBackgroundColor: Colors.black38,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
);
