// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

/// THIS CLASS HOLDS THE APP'S PREDEFINED DIMENTIONS AND SPACING
class AppDimentions {
  /// ADDS A VERTICAL SPACE BY ADDING A SIZED BOX WITH HEIGHT [16]
  static SizedBox verticalSpace([double? dimention]) =>
      SizedBox(height: dimention ?? k16);

  /// ADDS A VERTICAL SPACE BY ADDING A SIZED BOX WITH WIDTH [16]
  static SizedBox horizontalSpace([double? dimention]) =>
      SizedBox(width: dimention ?? k16);

  /// XYSpacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a [Flex] container, like [Row] or [Column].
  static Spacer XYSpace([int flex = 1]) => Spacer(
        flex: flex,
      );

  static double small = k10;
  static double medium = k16;
  static double large = k20;
  static double extraLarge = k24;

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
