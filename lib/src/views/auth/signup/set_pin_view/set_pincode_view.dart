// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_navigator/go/go.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay_by_apex/src/views/auth/success_view.dart';

import '../../../../logic/logger/logger.dart';
import '../../../utils/app_dimentions.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/back_button.dart';
import '../../../utils/components/header_widget.dart';
import '../../../utils/components/numeric_keyboard.dart';
import '../../../utils/enums.dart';
import '../../../utils/style/app_colors.dart';

class SetPincodeView extends StatefulWidget {
  static const String routeName = '/SetPincodeView';
  const SetPincodeView({super.key});

  @override
  State<SetPincodeView> createState() => _SetPincodeViewState();
}

class _SetPincodeViewState extends State<SetPincodeView> {
  final pincodeCtl = TextEditingController();

  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  late final PinTheme errorTheme;

  @override
  void initState() {
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.w900),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: AppColors.kpeachGreenColor, width: 1.0),
        ),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border(
        bottom: BorderSide(color: AppColors.kpeachGreenColor, width: 1.5),
      ),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border(
          bottom: BorderSide(color: AppColors.kpeachGreenColor, width: 1.5),
        ),
      ),
    );
    errorTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: Border(bottom: BorderSide(color: AppColors.alertError)),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
              minWidth: constraints.minWidth,
              maxHeight: MediaQuery.of(context).size.height / 2.6),
          child: NumericKeyboard(
            controller: pincodeCtl,
            length: 5,
            enableBiometric: true,
            iconBiometricColor: Colors.blue[400],
            onChange: (pin) {
              Logger.log(tag: Tag.DEBUG, message: 'PIN: $pin');
              setState(() {
                pincodeCtl.text = pincodeCtl.text + pin;
              });
            },
            onAsterics: () {
              pincodeCtl.text = '${pincodeCtl.text}*';
            },
          ),
        );
      }),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimentions.k16,
            vertical: AppDimentions.k12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              backButton(context),
              HeaderWidget(context,
                  title: 'Set your PIN code',
                  subtitle:
                      'We use state-of-the-art security measures to protect your information at all times'),
              Align(
                alignment: Alignment.center,
                child: Pinput(
                  isCursorAnimationEnabled: true,
                  cursor: Container(
                    width: 1,
                    height: 24,
                    color: AppColors.kpeachGreenColor,
                  ),
                  length: 5,
                  obscureText: true,
                  obscuringCharacter: '•',
                  controller: pincodeCtl,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  errorPinTheme: errorTheme,
                  validator: (s) {
                    return s == '22222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
              AppDimentions.verticalSpace(AppDimentions.k26 * 3.5),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                applyMargin: true,
                btnText: 'Create PIN',
                onTap: () {
                  Go(context).to(routeName: SuccessView.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
