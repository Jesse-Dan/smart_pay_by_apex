/// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../views/components/app_custom_loader.dart';
import '../../views/components/app_dialogue.dart';
import '../../views/utils/enums.dart';
import '../logger/logger.dart';

/// HandleAlertTypedisplay
class BaseHandler {
  /// Type ofAlertTypeto show
  final Tag tag;

  /// The message to display in the alert
  final String message;

  /// Stack trace if applicable
  final StackTrace? stackTrace;

  /// The context to show theAlertTypein
  final BuildContext context;

  /// Callback function whenAlertTypeis dismissed
  final dynamic callBackOne;

  /// Text for the action button in the alert
  final String btnText;

  /// Whether theAlertTypecan be dismissed by tapping outside

  final bool barrierDismissible;

  final String title;

  final VoidCallback? callBackTwo;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final HandlerBtnCount? handlerBtnCount;

  final Widget? child;
  BaseHandler({
    this.callBackOne,
    this.callBackTwo,
    this.callBackTextOne,
    this.callBackTextTwo,
    this.handlerBtnCount,
    this.child,
    required this.context,
    required this.tag,
    required this.message,
    this.title = 'Done',
    this.stackTrace,
    this.btnText = '',
    this.barrierDismissible = false,
  }) {
    /// Show theAlertTypedialog when an instance of HandelerModel is created
    showDialog(
        barrierDismissible: barrierDismissible,

        /// DismissAlertTypeby tapping outside
        context: context,
        builder: (_) => tag == Tag.LOADING
            ? AppLoadingIndicator()
            : child ??
                AppDialogue(
                  callBackOne: callBackOne,
                  callBackTwo: callBackTwo,
                  callBackTextOne: callBackTextOne,
                  callBackTextTwo: callBackTextTwo,
                  handlerBtnCount: handlerBtnCount,
                  title: title,
                  tag: tag,
                  message: message,
                  btnText: btnText,
                ));

    Logger.log(
        tag: tag,
        message: "\nTitle: $title\nMessage: $message\n",
        error: null,
        stackTrace: stackTrace);
  }
}
