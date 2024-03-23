import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../AppFontsStyles.dart';


class AppTextTheme {
  static TextTheme darkTextTheme() => TextTheme(
    // Display Styles
    displayLarge: AppFontsStyles.displayLarge(AppColors.kprimaryColor),
    displayMedium: AppFontsStyles.displayMedium(AppColors.kprimaryColor),
    displaySmall: AppFontsStyles.displaySmall(AppColors.kprimaryColor),

    // Headline Styles
    headlineLarge: AppFontsStyles.headlineLarge(AppColors.kprimaryColor),
    headlineMedium: AppFontsStyles.headlineMedium(AppColors.kprimaryColor),
    headlineSmall: AppFontsStyles.headlineSmall(AppColors.kprimaryColor),

    // Title Styles
    titleLarge: AppFontsStyles.titleLarge(AppColors.kprimaryColor),
    titleMedium: AppFontsStyles.titleMedium(AppColors.kprimaryColor),
    titleSmall: AppFontsStyles.titleSmall(AppColors.kprimaryColor),

    // Body Styles
    bodyLarge: AppFontsStyles.bodyLarge(AppColors.kprimaryColor),
    bodyMedium: AppFontsStyles.bodyMedium(AppColors.kprimaryColor),
    bodySmall: AppFontsStyles.bodySmall(AppColors.kprimaryColor),

    // Label Styles
    labelLarge: AppFontsStyles.labelLarge(AppColors.kprimaryColor),
    labelMedium: AppFontsStyles.labelMedium(AppColors.kprimaryColor),
    labelSmall: AppFontsStyles.labelSmall(AppColors.kprimaryColor),


    // Other styles (caption, button, overline) can be added here

  );

  static TextTheme lightTextTheme() => TextTheme(
  // Display Styles
  displayLarge: AppFontsStyles.displayLarge(AppColors.kprimaryColor),
  displayMedium: AppFontsStyles.displayMedium(AppColors.kprimaryColor),
  displaySmall: AppFontsStyles.displaySmall(AppColors.kprimaryColor),

  // Headline Styles
  headlineLarge: AppFontsStyles.headlineLarge(AppColors.kprimaryColor),
  headlineMedium: AppFontsStyles.headlineMedium(AppColors.kprimaryColor),
  headlineSmall: AppFontsStyles.headlineSmall(AppColors.kprimaryColor),

  // Title Styles
  titleLarge: AppFontsStyles.titleLarge(AppColors.kprimaryColor),
  titleMedium: AppFontsStyles.titleMedium(AppColors.kprimaryColor),
  titleSmall: AppFontsStyles.titleSmall(AppColors.kprimaryColor),

  // Body Styles
  bodyLarge: AppFontsStyles.bodyLarge(AppColors.kprimaryColor),
  bodyMedium: AppFontsStyles.bodyMedium(AppColors.kprimaryColor),
  bodySmall: AppFontsStyles.bodySmall(AppColors.kprimaryColor),

  // Label Styles
  labelLarge: AppFontsStyles.labelLarge(AppColors.kprimaryColor),
  labelMedium: AppFontsStyles.labelMedium(AppColors.kprimaryColor),
  labelSmall: AppFontsStyles.labelSmall(AppColors.kprimaryColor),
  );

}