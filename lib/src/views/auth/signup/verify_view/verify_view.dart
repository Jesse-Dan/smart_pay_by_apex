import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/get_token_bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/verify_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/verify_bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_notifier.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/numeric_keyboard.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';

import '../../../../logic/handler/handlers/error_handler.dart';
import '../../../utils/app_dimentions.dart';
import '../../../utils/components/app_button.dart';
import '../../../utils/components/back_button.dart';
import '../../../utils/components/header_widget.dart';
import '../../../utils/enums.dart';
import '../../../utils/style/app_colors.dart';
import 'model/get_token_payload.dart';

class VerifyView extends StatefulWidget {
  final String? email;
  final String route;
  static const String routeName = '/VerifyView';
  const VerifyView({super.key, required this.email, required this.route});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  TextEditingController pinInputController = TextEditingController();
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  late final PinTheme errorTheme;
  int _timerCount = 30;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
        });
      } else {
        setState(() {
          _timerCount = 30;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _startTimer();

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

    /// Sorry about this impl i had no time
    Timer(Constants.tokenDuration, () {
      var token = GetTokenEvent.getToken(widget.email!);
      if (token == null) {
        AppNotifier.notifyAction(context,
            message: 'An error occured. Click on Recent Code');
      }
      AppNotifier.notifyAction(context,
          message: 'Token: ${GetTokenEvent.getToken(widget.email!)}');
    });

    super.initState();
  }

  final _verifyBloc = VerifyBloc(const InitialVerifyState());
  final _getTokenBloc = GetTokenBloc(const InitialGetTokenState());

  String? pinErrorText;
  String? token = '33332';

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetTokenBloc, GetTokenState>(
      bloc: _getTokenBloc,
      listener: (context, state) {
        Logger.log(tag: Tag.DEBUG, message: 'Listener Says: $state');

        if (state is LoadedGetTokenState) {
          Logger.log(
              tag: Tag.DEBUG,
              message: 'Listener Says: ${state.getTokenResponse.data!.token!}');
          AppNotifier.notifyAction(context,
              message: 'Token: ${state.getTokenResponse.data!.token!}');
          ErrorHandler(
              context: context,
              message: state.getTokenResponse.data!.token!,
              handlerBtnCount: HandlerBtnCount.one,
              callBackTextOne: 'Okay');
        }

        if (state is ErrorGetTokenState) {
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
                Logger.log(tag: Tag.DEBUG, message: 'PIN: //');
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
                              text:
                                  ' *****@${widget.email?.split('@')[1].split('.')[0]}.com ',
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
                          return pinErrorText;
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                      ),
                    ),
                    AppDimentions.verticalSpace(AppDimentions.k20),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            _timer.cancel();
                            _timerCount = 30;
                            _startTimer();

                            /// Request  Token
                            final getTokenBloc =
                                GetTokenBloc(const InitialGetTokenState());

                            getTokenBloc.add(LoadGetTokenEvent(
                                getTokenPayload: GetTokenPayload(
                              email: widget.email,
                            )));

                            /// Sorry about this impl i had no time
                            Timer(Constants.tokenDuration, () {
                              var token = GetTokenEvent.getToken(widget.email!);
                              if (token == null) {
                                AppNotifier.notifyAction(context,
                                    message:
                                        'An error occured. Click on Recent Code');
                              }
                              AppNotifier.notifyAction(context,
                                  message:
                                      'Token: ${GetTokenEvent.getToken(widget.email!)}');
                            });
                          },
                          child: Text(
                            'Resend Code in $_timerCount ${_timerCount <= 1 ? 'sec' : 'secs'} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kgrey500),
                          )),
                    ),
                    AppDimentions.verticalSpace(AppDimentions.k20),
                    AppButton(
                      buttonType: ButtonType.LONG_BTN,
                      flex: true,
                      applyMargin: true,
                      btnText: 'Continue',
                      onTap: () {
                        _verifyBloc.add(SendVerifyEvent(VerifyTokenPayload(
                            email: widget.email,
                            token: pinInputController.text)));
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
