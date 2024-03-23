import 'package:flutter/material.dart';

import '../app_dimentions.dart';
import '../style/app_colors.dart';

Column HeaderWidget(BuildContext context,
    {Widget? titleWidget,
    Widget? subTitleWidget,
    String? title,
    String? subtitle,
    bool centerItems = false}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      AppDimentions.verticalSpace(AppDimentions.k22),
      Align(
        alignment: centerItems ? Alignment.center : Alignment.topLeft,
        child: titleWidget ??
            Visibility(
              visible: title != null,
              child: Text(
                title ?? 'Title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.20000000298023224,
                    color: AppColors.kgrey900),
                textAlign: centerItems ? TextAlign.center : TextAlign.left,
              ),
            ),
      ),
      AppDimentions.verticalSpace(10),
      Align(
          alignment: centerItems ? Alignment.center : Alignment.topLeft,
          child: subTitleWidget ??
              Visibility(
                  visible: subtitle != null,
                  child: Text(
                    subtitle ?? 'Subtitle',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.20000000298023224,
                        color: AppColors.kgrey500),
                    textAlign: centerItems ? TextAlign.center : TextAlign.left,
                  ))),
      AppDimentions.verticalSpace(AppDimentions.large),
    ],
  );
}
