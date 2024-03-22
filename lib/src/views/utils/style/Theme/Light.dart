import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'TextTheme.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: AppTextTheme.lightTextTheme(),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      modalBackgroundColor: AppColors.white,
    ));
