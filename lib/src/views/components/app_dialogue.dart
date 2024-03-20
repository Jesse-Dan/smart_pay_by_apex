// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/enums.dart';
import '../utils/style/app_colors.dart';


class AppDialogue extends StatelessWidget {
  const AppDialogue(
      {Key? key,
      this.tag = Tag.LOADING,
      this.message,
      this.btnText = '',
      this.title,
      this.callBackOne,
      this.callBackTwo,
      this.callBackTextOne,
      this.callBackTextTwo,
      this.handlerBtnCount,
      this.child,
      this.titleColor,
      this.callBackTextTwoColor,
      this.callBackTextOneColor})
      : super(key: key);
  final Tag tag;
  final String? message;
  final String? title;
  final VoidCallback? callBackOne;
  final String btnText;
  final VoidCallback? callBackTwo;
  final String? callBackTextOne;
  final String? callBackTextTwo;
  final Color? titleColor;
  final Color? callBackTextTwoColor;
  final Color? callBackTextOneColor;
  final HandlerBtnCount? handlerBtnCount;
  final Widget? child;

  String getImage(Tag tag) {
    switch (tag) {
      case Tag.PERSON_SUCCESS:
        return 'assets/images/person_alert.png';
      case Tag.SUCCESS:
        return 'assets/images/done_alert.png';
      default:
        return 'assets/images/done_alert.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>? actions = _getActions(context);

    return AlertDialog.adaptive(
      surfaceTintColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      insetPadding: const EdgeInsets.only(left: 50, right: 50),
      buttonPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      actionsPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      titlePadding: const EdgeInsets.symmetric(vertical: 16),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title ?? '',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      content: child ??
          Text(
            message ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF464646),
              fontSize: 16,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
      actions: actions ?? [],
    );
  }

  List<Widget>? _getActions(BuildContext context) {
    if (handlerBtnCount == HandlerBtnCount.one) {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button Text', callBackOne,
            callBackTextOneColor),
      ];
    }
    if (handlerBtnCount == HandlerBtnCount.two) {
      return [
        _alertBTN(context, callBackTextOne ?? 'Button 1 Text', callBackOne,
            callBackTextOneColor),
        _alertBTN(context, callBackTextTwo ?? 'Button 2 Text', callBackTwo,
            callBackTextTwoColor),
      ];
    }
    return [];
  }

  GestureDetector _alertBTN(
      BuildContext context, String btnText, VoidCallback? callback, textColor) {
    return GestureDetector(
      onTap: callback ?? () => Navigator.pop(context),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.kprimary.withOpacity(0.2)),
          height: 42,
          width: 115,
          child: Center(
            child: Text(
              btnText,
              style: GoogleFonts.dmSans(
                color: textColor ?? AppColors.kprimary.withOpacity(0.9),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class AppDialogue2 extends StatelessWidget {
//   final String? message;
//   final String? title;
//   final VoidCallback? callBackOne;
//   final VoidCallback? callBackTwo;
//   final String? callBackTextOne;
//   final String? callBackTextTwo;

//   final String btnText;
//   final HandlerBtnCount appDialogue2Type;

//   const AppDialogue2(
//       {super.key,
//       this.message,
//       this.title,
//       required this.btnText,
//       this.callBackOne,
//       this.callBackTwo,
//       this.appDialogue2Type = HandlerBtnCount.two,
//       this.callBackTextOne,
//       this.callBackTextTwo});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> actions = _getActions(context);

//     return appDialogue2Type == HandlerBtnCount.loading
//         ? AlertDialog(
// actionsAlignment: MainAxisAlignment.center,
// insetPadding: const EdgeInsets.only(left: 10, right: 10),
// shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(16.0))),
// titlePadding: const EdgeInsets.all(0),
// contentPadding: const EdgeInsets.all(0),
// title: Container(
//   alignment: Alignment.center,
//   margin: const EdgeInsets.symmetric(
//       vertical: AppDimentions.k20, horizontal: AppDimentions.k20),
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(16),
//         topRight: Radius.circular(16)),
//   ),
//   width: double.infinity,
//   height: 50,
//               child: Text(
//                 title ?? 'Processing Action',
//                 style: const TextStyle(
//                   color: Color(0xFFD75B6B),
//                   fontSize: 24,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: AppDimentions.k16),
//                 Text(
//                   message ?? 'action..',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Color(0xFF464646),
//                     fontSize: 16,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 const SizedBox(height: AppDimentions.k20 * 2),
//                 AppLoadingIndicator(),
//                 const SizedBox(height: AppDimentions.k20),
//               ],
//             ),
//           )
//         : AlertDialog(
//             actionsAlignment: MainAxisAlignment.center,
//             insetPadding: const EdgeInsets.only(left: 30, right: 30),
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16.0))),
//             titlePadding: const EdgeInsets.all(0),
//             contentPadding: const EdgeInsets.all(0),
//             title: Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: AppDimentions.k20),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16)),
//               ),
//               width: double.infinity,
//               height: 50,
//               child: Text(
//                 title ?? 'Processing Action',
//                 style: const TextStyle(
//                   color: Color(0xFFD75B6B),
//                   fontSize: 24,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 342 / 8, right: 342 / 8, top: 30, bottom: 50),
//                   child: Center(
//                     child: Text(
//                       message ?? 'Hello! \n Contact support@bakkaz.com',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.dmSans(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             actionsOverflowButtonSpacing: AppDimentions.k14,
//             actions: actions,
//           );
//   }

//   List<Widget> _getActions(BuildContext context) {
//     if (appDialogue2Type == HandlerBtnCount.one) {
//       return [
//         _alertBTN(context, callBackTextOne ?? 'Button Text', callBackOne),
//       ];
//     } else {
//       return [
//         _alertBTN(context, callBackTextOne ?? 'Button 1 Text', callBackOne),
//         _alertBTN(context, callBackTextTwo ?? 'Button 2 Text', callBackTwo),
//       ];
//     }
//   }

//   Padding _alertBTN(
//       BuildContext context, String btnText, VoidCallback? callback) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: GestureDetector(
//         onTap: callback ?? () => Navigator.pop(context),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: AppColors.kwineColor.withOpacity(0.2)),
//           height: 42,
//           width: 115,
//           child: Center(
//             child: Text(
//               btnText,
//               style: GoogleFonts.dmSans(
//                 color: AppColors.kwineColor.withOpacity(0.9),
//                 fontWeight: FontWeight.w700,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
