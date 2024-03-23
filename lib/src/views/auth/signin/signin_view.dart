// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/error_handler.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/loading_handler.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/success_handler.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/app/home/home.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/payloads/signin_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/password_recovery_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../../../logic/handler/base_handler.dart';
import '../../utils/components/app_horizontal_divider.dart';
import '../../utils/components/back_button.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/helpers/target_platform.dart';
import '../signup/signup_view/signup_view.dart';

class SigninView extends StatefulWidget {
  static const String routeName = '/SigninView';
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _authBloc = SignInBloc(InitialAuthState());
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  bool showPassword = true;
  

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<SignInBloc, SignInState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is LoadingAuthState) {
          LoadingHandler(context: context);
        }

        if (state is SignInLoadedAuthState) {
          Go(context).pop();
          SuccessHandler(context: context, message: 'Login Sucessful');
          Timer(const Duration(seconds: 2), () {
            Go(context).pop();
            Go(context)
                .toAndReplaceAllNamedRoute(routeName: HomeView.routeName);
          });
        }

        if (state is ErrorAuthState) {
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
                    title: 'Hi There! 👋',
                    subtitle: 'Welcome back, Sign in to your account'),
                AppTextField(hintText: 'Email', controller: emailCtl),
                AppTextField(
                    hintText: 'Password',
                    controller: passwordCtl,
                    textFieldType: TextFieldType.PASSWORD,
                    obscureText: showPassword,
                    onChanged: (p0) {
                      setState(() {});
                    },
                    onSufficIconClicked: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    fieldTextStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            color: AppColors.kprimaryColor,
                            fontSize: passwordCtl.text.isEmpty ? 14 : 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: passwordCtl.text.isEmpty ? 1 : 3)),
                AppDimentions.verticalSpace(AppDimentions.large),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Forgot Password?',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Go(context).to(
                                  routeName: PasswordRecoveryView.routeName);
                            }),
                    ],
                  ),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.20000000298023224,
                      color: AppColors.kprimary),
                  textAlign: TextAlign.left,
                ),
                AppDimentions.verticalSpace(AppDimentions.large),
                AppButton(
                  onTap: () {
                    String platformString = getPlatformString();
                    Logger.log(
                        tag: Tag.DEBUG,
                        message: 'Platform: ${getPlatformString()}');
                    _authBloc.add(
                      LoginEvent(
                        signInPayload: SignInPayload(
                          email: emailCtl.text,
                          password: passwordCtl.text,
                          deviceName: platformString,
                        ),
                      ),
                    );
                  },
                  buttonType: ButtonType.LONG_BTN,
                  flex: true,
                  applyMargin: false,
                  btnText: 'Sign In',
                ),
                AppDimentions.verticalSpace(AppDimentions.large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildSeparator(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'OR',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.20000000298023224,
                            color: AppColors.kgrey500),
                      ),
                    ),
                    buildSeparator(),
                  ],
                ),
                AppDimentions.verticalSpace(AppDimentions.large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppButton(
                      onTap: () {
                        BaseHandler(
                            tag: Tag.DEBUG,
                            title: 'Feature Not Found',
                            context: context,
                            message: 'This feature is not implemented.',
                            handlerBtnCount: HandlerBtnCount.one,
                            callBackTextOne: 'Okay');
                      },
                      addBorder: true,
                      flex: true,
                      applyMargin: false,
                      btnContentType: BtnContentType.IMG,
                      buttonType: ButtonType.LONG_BTN,
                      btnColor: AppColors.white,
                      borderColor: AppColors.kgrey300,
                      btnContent:
                          const ImageViewer(imagePath: AppAsset.googleLogo),
                    ),
                    AppDimentions.horizontalSpace(AppDimentions.medium),
                    AppButton(
                      onTap: () {
                        BaseHandler(
                            tag: Tag.DEBUG,
                            title: 'Feature Not Found',
                            context: context,
                            message: 'This feature is not implemented.',
                            handlerBtnCount: HandlerBtnCount.one,
                            callBackTextOne: 'Okay');
                      },
                      addBorder: true,
                      flex: true,
                      applyMargin: false,
                      buttonType: ButtonType.LONG_BTN,
                      btnContentType: BtnContentType.IMG,
                      btnColor: AppColors.white,
                      borderColor: AppColors.kgrey300,
                      btnContent:
                          const ImageViewer(imagePath: AppAsset.appleLogo),
                    )
                  ],
                ),
                AppDimentions.verticalSpace(AppDimentions.k26 * 3),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.20000000298023224,
                        color: AppColors.kgrey500),
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                        ),
                        TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kprimary),
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Go(context).to(routeName: SignupView.routeName);
                              }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
