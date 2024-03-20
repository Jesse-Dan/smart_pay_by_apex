// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontsStyles {
  static final _montserrat = GoogleFonts.sofiaSans();
  // Display Styles
  static TextStyle displayLarge(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: color,
      );

  static TextStyle displayMedium(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 45,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
        color: color,
      );

  static TextStyle displaySmall(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Headline Styles
  static TextStyle headlineLarge(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.4,
        color: color,
      );

  static TextStyle headlineMedium(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle headlineSmall(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Title Styles (you can adjust font family based on your preference)
  static TextStyle titleLarge(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle titleMedium(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle titleSmall(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Body Styles
  static TextStyle bodyLarge(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: color,
      );

  static TextStyle bodyMedium(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: color,
      );

  static TextStyle bodySmall(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Label Styles
  static TextStyle labelLarge(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
        color: color,
      );

  static TextStyle labelMedium(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle labelSmall(Color color) => TextStyle(
        fontFamily: _montserrat.fontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color,
      );
}
