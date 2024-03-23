// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

import '../enums.dart';
import '../style/app_colors.dart';
import 'app_custom_loader.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      this.btnText,
      this.btntTextAlign,
      this.onDoubleTap,
      this.onTap,
      this.btnColor,
      this.borderColor,
      this.buttonType,
      this.btnTxtFontStyle,
      this.btnTxtFontSize,
      this.addBorder,
      this.onLongPress,
      this.btnTextColor,
      this.applyMargin,
      this.width = 100,
      this.height = 48,
      this.boxShadow,
      this.addboxShadow = false,
      this.btnContentType = BtnContentType.TEXT,
      this.btnContent,
      this.boxShadowColor,
      this.loading = false,
      this.loadingText = 'loading',
      this.borderRadius,
      this.disabled = false,
      this.flex = true})
      : super(key: key) {
    // if ((btnContentType != BtnContentType.TEXT && btnContent == null) ||
    //     (btnContentType != BtnContentType.TEXT &&
    //         (btnText == '' || btnText == null))) {
    //   throw Exception(
    //       'if btnContentType == BtnContentType.TEXT, btnContent == null  ||  btnText == null or '
    //       '');
    // }
  }

  final String? btnText;
  final TextAlign? btntTextAlign;
  final void Function()? onDoubleTap;
  final void Function()? onTap;
  void Function()? onLongPress;
  final Color? btnColor;
  final Color? borderColor;
  final Color? btnTextColor;
  final ButtonType? buttonType;
  final TextStyle? btnTxtFontStyle;
  final double? btnTxtFontSize;
  final bool? addBorder;
  final bool? applyMargin;
  final double? width;
  final double height;
  final List<BoxShadow>? boxShadow;
  final bool addboxShadow;
  final BtnContentType btnContentType;
  final Widget? btnContent;
  final Color? boxShadowColor;
  final bool loading;
  final String loadingText;
  final double? borderRadius;
  final bool disabled;
  final bool flex;

  @override
  Widget build(BuildContext context) {
    return flex
        ? Flexible(
            child: _build(context),
          )
        : _build(context);
  }

  InkWell _build(context) {
    return InkWell(
      onDoubleTap: disabled
          ? null
          : loading
              ? null
              : onDoubleTap,
      onTap: disabled
          ? null
          : loading
              ? null
              : onTap,
      onLongPress: disabled
          ? null
          : loading
              ? null
              : onLongPress,
      child: Container(
        margin: (applyMargin ?? false)
            ? const EdgeInsets.all(5)
            : const EdgeInsets.all(0),
        height: 56,
        width: (buttonType ?? ButtonType.SHORT_BTN) == ButtonType.LONG_BTN
            ? null
            : width,
        decoration: BoxDecoration(
          border: addBorder ?? false
              ? Border.all(color: borderColor ?? Colors.white)
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          color: disabled
              ? AppColors.kgrey200
              : btnColor ?? AppColors.kprimaryColor,
          boxShadow: !addboxShadow
              ? null
              : boxShadow ??
                  [
                    BoxShadow(
                      color: boxShadowColor ??
                          AppColors.kpeachGreenColor.withOpacity(0.1),
                      offset: const Offset(2,
                          2), // Increase the offset for a more visible shadow
                      blurStyle: BlurStyle.outer,
                      blurRadius:
                          7, // Increase the blur radius for a softer shadow
                    )
                  ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: btnContentType == BtnContentType.IMG
              ? btnContent
              : _loaderByText(context),
        ),
      ),
    );
  }

  Widget _loaderByText(context) {
    return loading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLoadingIndicator(color: Colors.transparent),
              const SizedBox(width: 5),
              _text(text: '$loadingText...', context: context),
            ],
          )
        : _text(context: context);
  }

  Text _text({text, context}) {
    return Text(
      loading ? text : btnText ?? '',
      style: btnTxtFontStyle ??
          Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.20000000298023224,
                color: btnTextColor ?? Colors.white,
              ),
      textAlign: btntTextAlign ?? TextAlign.start,
    );
  }
}
