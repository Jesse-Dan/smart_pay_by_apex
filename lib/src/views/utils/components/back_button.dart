import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

backButton(context, [VoidCallback? onPop]) => InkWell(
      onTap: onPop ??
          () {
            Go(context).pop();
          },
      canRequestFocus: true,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.kgrey200),
            borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 15,
        ),
      ),
    );
