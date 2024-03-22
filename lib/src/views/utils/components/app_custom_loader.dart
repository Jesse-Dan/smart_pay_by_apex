// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/line_scale_party_progress_indicator.dart';

import '../style/app_colors.dart';

LoadingProgressIndicator AppCustomSpinner(
    {dynamic loaderColor, double? size, shape = BoxShape.circle}) {
  return LoadingProgressIndicator(
    size: (size) ?? 24,
    indicator: LineScalePartyProgressIndicator(),
    color: loaderColor ?? AppColors.kprimaryColor,
  );
}

/// [OVERLAY LOAD]
Widget AppLoadingIndicator({Color? color, loaderColor, size}) => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppCustomSpinner(loaderColor: loaderColor, size: size),
        ),
      ),
    );
