import 'package:flutter/material.dart';


/// THIS CLASS HOLDS THE APP'S PREDEFINED DIMENTIONS AND SPACING
class AppDimention {
  /// ADDS A VERTICAL SPACE BY ADDING A SIZED BOX WITH HEIGHT
  static SizedBox verticalSpace([double? dimention]) =>
      SizedBox(height: dimention ?? k16);

  /// ADDS A VERTICAL SPACE BY ADDING A SIZED BOX WITH WIDTH
  static SizedBox horizontalSpace([double? dimention]) =>
      SizedBox(width: dimention ?? k16);

  static double k10 = 10;
  static double k12 = 12;
  static double k14 = 14;
  static double k16 = 16;
  static double k18 = 18;
  static double k20 = 20;
  static double k22 = 22;
  static double k24 = 24;
  static double k26 = 26;
}
