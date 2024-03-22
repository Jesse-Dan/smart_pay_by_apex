import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/verify_bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/verify_bloc/verify_bloc.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/numeric_keyboard.dart';

import '../../../../logic/handler/handlers/error_handler.dart';
import '../../../../logic/handler/handlers/loading_handler.dart';
import '../../../../logic/handler/handlers/success_handler.dart';
import '../../../utils/app_dimentions.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/back_button.dart';
import '../../../utils/components/header_widget.dart';
import '../../../utils/enums.dart';
import '../../../utils/style/app_colors.dart';
import '../about_self_view/about_self_view.dart';

class VerifyView extends StatefulWidget {
  final String? email;
  static const String routeName = '/VerifyView';
  const VerifyView({super.key, required this.email});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  TextEditingController pinInputController = TextEditingController();
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  late final PinTheme errorTheme;

  @override
  void initState() {
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: AppColors.kgrey900, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.kgrey100,
        border: Border.all(color: AppColors.kgrey100),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.kpeachGreenColor),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.kpeachGreenColor),
      ),
    );
    errorTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: AppColors.alertError),
      ),
    );
    super.initState();
  }

  final _authBloc = VerifyBloc(InitialVerifyState());

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyBloc, VerifyState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is LoadingVerifyState) {
          LoadingHandler(context: context);
        }

        if (state is VerifyLoadedVerifyState) {
          Go(context).pop();
          SuccessHandler(
              context: context,
              message: 'Registration Sucessful',
              handlerBtnCount: HandlerBtnCount.one,
              callBackTextOne: 'Proceed');
        }

        if (state is ErrorVerifyState) {
          Go(context).pop();
          ErrorHandler(
              context: context,
              message: state.errorMessage,
              handlerBtnCount: HandlerBtnCount.one,
              callBackTextOne: 'Okay');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomSheet: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: constraints.maxWidth,
                minWidth: constraints.minWidth,
                maxHeight: MediaQuery.of(context).size.height / 2.6),
            child: NumericKeyboard(
              controller: pinInputController,
              length: 5,
              enableBiometric: true,
              iconBiometricColor: Colors.blue[400],
              onChange: (pin) {
                Logger.log(tag: Tag.DEBUG, message: 'PIN: $pin');
                setState(() {
                  pinInputController.text = pinInputController.text + pin;
                });
              },
              onAsterics: () {
                pinInputController.text = '${pinInputController.text}*';
              },
            ),
          );
        }),
        body: LayoutBuilder(
          builder: (context, constraints) => ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimentions.k16,
                vertical: AppDimentions.k12,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    backButton(context),
                    HeaderWidget(
                      context,
                      title: 'Verify it’s you',
                      subTitleWidget: Text.rich(
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.20000000298023224,
                            color: AppColors.kgrey500),
                        textAlign: TextAlign.left,
                        TextSpan(
                          children: [
                            const TextSpan(text: 'We send a code to ('),
                            TextSpan(
                              text: ' *****@mail.com ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.20000000298023224,
                                      color: AppColors.kgrey900),
                            ),
                            const TextSpan(
                                text:
                                    '). Enter it here to verify your identity'),
                          ],
                        ),
                      ),
                    ),
                    AppDimentions.verticalSpace(AppDimentions.k20),
                    Align(
                      alignment: Alignment.center,
                      child: Pinput(
                        length: 5,
                        controller: pinInputController,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        errorPinTheme: errorTheme,
                        validator: (s) {
                          return s == '2222' ? null : 'Pin is incorrect';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                    AppDimentions.verticalSpace(AppDimentions.k20),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Resend Code 30 secs',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.20000000298023224,
                                  color: AppColors.kgrey900),
                        )),
                    AppDimentions.verticalSpace(AppDimentions.k20),
                    AppButton(
                      buttonType: ButtonType.LONG_BTN,
                      flex: true,
                      applyMargin: true,
                      btnText: 'Continue',
                      onTap: () {
                        Go(context).to(routeName: AboutSelfView.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
