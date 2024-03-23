import 'package:flutter/material.dart';
import '../../../views/utils/enums.dart';
import '../base_handler.dart';

class LoadingHandler {
  final String message;
  final StackTrace? stackTrace;
  final BuildContext context;
  final dynamic callBack;
  final String btnText;
  final bool barrierDismissible;
  LoadingHandler({
    required this.context,
    this.message = 'Done',
    this.stackTrace,
    this.callBack,
    this.btnText = '',
    this.barrierDismissible = false,
  }) {
    BaseHandler(
      context: context,
      message: message,
      tag: Tag.LOADING,
      stackTrace: stackTrace,
      callBackOne: callBack,
      btnText: btnText,
      barrierDismissible: barrierDismissible,
    );
  }
}
