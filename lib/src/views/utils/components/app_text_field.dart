// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/hex_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

import '../app_dimentions.dart';
import '../enums.dart';
import '../style/app_colors.dart';
import 'dropdown_button.dart';

class AppTextField extends StatefulWidget {
  ///  text controller
  final TextEditingController controller;

  /// hint text
  final String hintText;

  /// marker  for if the text field type is password and this is used to sed the text visibility
  final bool obscureText;

  ///marker for app disable status
  final bool isEnabled;

  /// con changed
  final void Function(String)? onChanged;

  /// on completed
  final void Function(String)? onCompleted;

  /// set text field type
  final TextFieldType textFieldType;

  /// set text label text
  final String? labelText;

  /// set text input type
  final TextInputType? keyboardType;

  /// on clicked on a suffix icon
  final void Function()? onSufficIconClicked;

  /// validate text field
  final String? Function(String?)? validator;

  /// on tap callback of the text field
  final void Function()? onTap;

  /// items for when text field type is set to dropdown
  final List<String> items;

  /// marker to let text field be editable
  final bool readOnly;

  /// marker to let text field be editable
  final TextStyle? fieldTextStyle;

  /// used when type is dropdown
  String? value;

  /// text field prefix
  Widget? prefix;

  /// text field suffix
  Widget? suffix;

  /// content Padding of TF
  EdgeInsetsGeometry? contentPadding;
  AppTextField(
      {Key? key,
      required this.controller,
      this.hintText = 'Enter Text',
      this.obscureText = false,
      this.isEnabled = true,
      this.onChanged,
      this.textFieldType = TextFieldType.TEXT,
      this.labelText,
      this.keyboardType,
      this.onSufficIconClicked,
      this.validator,
      this.onTap,
      this.items = const [],
      this.value,
      this.readOnly = false,
      this.onCompleted,
      this.fieldTextStyle,
      this.prefix,
      this.suffix,
      this.contentPadding})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState<T> extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: AppDimentions.medium),
        Visibility(
          visible: widget.labelText != null,
          child: SizedBox(
            width: 288,
            child: Text(
              widget.labelText ?? '',
              style: myTextFieldLabelStyle(context),
            ),
          ),
        ),
        Visibility(
            visible: widget.labelText != null,
            child: SizedBox(height: AppDimentions.small)),
        SizedBox(
          height: 56,
          child: widget.textFieldType == TextFieldType.PASSWORD
              ? SizedBox(
                  // height: 60,
                  child: TextFormField(
                    cursorHeight: AppDimentions.k16,
                    style: widget.fieldTextStyle ?? myTextFieldStyle(context),
                    keyboardType: TextInputType.visiblePassword,
                    controller: widget.controller,
                    validator: widget.validator,
                    decoration: InputDecoration(
                      labelStyle: myTextFieldHintStyle(context),
                      labelText: widget.hintText,
                      hintText: widget.hintText,
                      filled: true,
                      fillColor: AppColors.kgrey100,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: IconButton(
                          onPressed: widget.onSufficIconClicked,
                          icon: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: ImageViewer(
                              imagePath: widget.obscureText
                                  ? AppAsset.eyesOff
                                  : AppAsset.eyesOn,
                              color: AppColors.kgrey500,
                            ),
                          )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#F9FAFB')),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#F9FAFB')),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.kpeachGreenColor),
                          borderRadius: BorderRadius.circular(16)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.alertError)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.alertError),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    obscureText: widget.obscureText,
                    enabled: widget.isEnabled,
                    onChanged: widget.onChanged,
                    cursorColor: AppColors.kpeachGreenColor,
                  ),
                )
              : widget.textFieldType == TextFieldType.DROPDOWN
                  ? Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.kgrey100,
                          border: Border.all(color: AppColors.kgrey100),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                child: SizedBox(
                                    child: Text(
                              widget.controller.text.isEmpty
                                  ? widget.hintText
                                  : widget.controller.text,
                              style:
                                  !widget.items.contains(widget.controller.text)
                                      ? myTextFieldHintStyle(context)
                                      : widget.fieldTextStyle ??
                                          myTextFieldStyle(context),
                            ))),
                            SizedBox(
                              width: 100,
                              height: 60,
                              child: appDropdownButton(
                                controller: widget.controller,
                                items: widget.items,
                                value: widget.value,
                                onChanged: (String? val) {
                                  if (val != 'Loading...' ||
                                      val != 'Error fetching countries') {
                                    setState(() {
                                      widget.value = val;
                                      widget.controller.text = val!;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : widget.textFieldType == TextFieldType.OTP
                      ? PinCodeTextField(
                          autofocus: true,
                          controller: widget.controller,
                          hideCharacter: false,
                          maxLength: 4,
                          hasError: false,
                          maskCharacter: "•",
                          onTextChanged: widget.onChanged,
                          onDone: widget.onCompleted,
                          pinBoxWidth: 56,
                          pinBoxHeight: 70,
                          hasUnderline: false,
                          wrapAlignment: WrapAlignment.spaceBetween,
                          pinBoxDecoration: myPinBoxDecoration,
                          pinTextStyle: TextStyle(
                            color: AppColors.kprimary.withOpacity(.7),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          pinTextAnimatedSwitcherTransition:
                              ProvidedPinBoxTextAnimation.scalingTransition,
                          pinBoxColor: AppColors.kprimary.withOpacity(0.09),
                          pinTextAnimatedSwitcherDuration:
                              const Duration(milliseconds: 400),
                          keyboardType: TextInputType.number,
                        )
                      : TextFormField(
                          cursorHeight: AppDimentions.k16,
                          onTap: widget.onTap,
                          readOnly: widget.readOnly,
                          keyboardType: widget.keyboardType,
                          controller: widget.controller,
                          validator: widget.validator,
                          style: widget.fieldTextStyle ??
                              myTextFieldStyle(context),
                          decoration: InputDecoration(
                              contentPadding: widget.contentPadding,
                             
                              filled: true,
                              fillColor: AppColors.kgrey100,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: myTextFieldHintStyle(context),
                              labelText: widget.hintText,
                              hintText: widget.hintText,
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor('#F9FAFB')),
                                  borderRadius: BorderRadius.circular(16)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor('#F9FAFB')),
                                  borderRadius: BorderRadius.circular(16)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.kpeachGreenColor),
                                  borderRadius: BorderRadius.circular(16)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.alertError)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.alertError),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              prefixIcon: widget.prefix,
                              suffix: widget.suffix),
                          obscureText: widget.obscureText,
                          enabled: widget.isEnabled,
                          onChanged: widget.onChanged,
                          cursorColor: AppColors.kpeachGreenColor,
                        ),
        )
      ],
    );
  }

  BoxDecoration myPinBoxDecoration(
    Color fillColor,
    Color borderColor, {
    double? borderWidth,
    double? radius,
  }) {
    return BoxDecoration(
        color: AppColors.kpeachGreenColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0)
        // Default radius if not provided
        );
  }

  TextStyle myTextFieldStyle(context, {color}) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
          color: AppColors.kprimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        );
  }

  TextStyle myTextFieldHintStyle(context, {color}) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
          color: AppColors.kgrey400,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
  }

  TextStyle myTextFieldLabelStyle(context, {color}) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontFamily: 'DM Sans',
          color: AppColors.kprimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
  }
}
