import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

Widget buildSeparator() {
  return Expanded(
    child: Container(
      width: 20.0,
      height: 1.1,
      color: AppColors.kgrey200, // Adjust color
    ),
  );
}
