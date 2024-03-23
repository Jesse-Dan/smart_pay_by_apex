// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../views/utils/enums.dart';
import '../base_handler.dart';

class ErrorHandler {
  final String message;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final dynamic callBackTwo;
  final String btnText;
  final bool barrierDismissible;
  final Tag tag;
  final HandlerBtnCount? handlerBtnCount;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final Widget? child;
  ErrorHandler({
    this.message = 'an unexpected error occured !',
    this.stackTrace,
    required this.context,
    this.callBack,
    this.callBackTwo,
    this.btnText = '',
    this.barrierDismissible = false,
    this.tag = Tag.ERROR,
    this.handlerBtnCount ,
    this.callBackTextOne,
    this.callBackTextTwo,
    this.child,
  }) {
    BaseHandler(
      callBackTextOne: callBackTextOne,
      callBackTextTwo: callBackTextTwo,
      child: child,
      handlerBtnCount: handlerBtnCount,
      context: context,
      message: message,
      tag: tag,
      title: "Error",
      stackTrace: stackTrace,
      callBackOne: callBack,
      callBackTwo: callBackTwo,
      btnText: btnText,
      barrierDismissible: barrierDismissible,
    );
  }
}
