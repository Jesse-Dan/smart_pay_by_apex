// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../views/utils/enums.dart';
import '../base_handler.dart';

class SuccessHandler {
  final String message;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  final dynamic callBackTwo;
  final HandlerBtnCount? handlerBtnCount;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final Widget? child;
  SuccessHandler({
    this.message = 'Done',
    this.stackTrace,
    required this.context,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
    this.callBackTwo,
    this.handlerBtnCount,
    this.callBackTextOne,
    this.callBackTextTwo,
    this.child,
  }) {
    BaseHandler(
      callBackTextOne: callBackTextOne,
      callBackTextTwo: callBackTextTwo,
      child: child,
      handlerBtnCount: handlerBtnCount,
      title: "Success",
      callBackOne: callBack,
      callBackTwo: callBackTwo,
      context: context,
      message: message,
      tag: Tag.SUCCESS,
      stackTrace: stackTrace,
      btnText: btnText,
      barrierDismissible: barrierDismissible,
    );
  }
}
