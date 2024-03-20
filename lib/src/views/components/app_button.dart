// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/style/app_colors.dart';
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
      this.applyInternalPadding,
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
  final bool? applyInternalPadding;
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
            child: _build(),
          )
        : _build();
  }

  InkWell _build() {
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
        margin: (applyInternalPadding ?? false)
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
          borderRadius: BorderRadius.circular(borderRadius ?? 2),
          color: disabled
              ? AppColors.kprimary
              : btnColor ?? AppColors.kpeachGreenColor,
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
              : _loaderByText(),
        ),
      ),
    );
  }

  Widget _loaderByText() {
    return loading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLoadingIndicator(color: Colors.transparent),
              const SizedBox(width: 5),
              _text(text: '$loadingText...'),
            ],
          )
        : _text();
  }

  Text _text({text}) {
    return Text(
      loading ? text : btnText ?? '',
      style: btnTxtFontStyle ??
          TextStyle(
            fontFamily: 'Satoshi',
            color: btnTextColor ?? Colors.white,
            fontSize: btnTxtFontSize ?? 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.36,
          ),
      textAlign: btntTextAlign ?? TextAlign.start,
    );
  }
}
