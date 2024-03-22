// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/logic/handler/base_handler.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/success_handler.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/signin_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../../utils/components/app_horizontal_divider.dart';
import '../../utils/components/back_button.dart';
import '../../utils/components/header_widget.dart';

class SignupView extends StatefulWidget {
  static const String routeName = '/SignupView';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailCtl = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  titleWidget: Text.rich(
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.20000000298023224,
                          color: AppColors.kgrey900),
                      TextSpan(children: [
                        TextSpan(text: 'Create a '),
                        TextSpan(
                          text: 'Smartpay',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.20000000298023224,
                                  color: AppColors.kprimary),
                        ),
                        TextSpan(text: ' account'),
                      ])),
                  subtitle: 'Join us as we make history in africa.'),
              AppTextField(hintText: 'Email', controller: emailCtl),
              AppDimentions.verticalSpace(AppDimentions.large),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                applyMargin: false,
                btnText: 'Sign Up',
                onTap: () {
                  Go(context).to(routeName: VerifyView.routeName);
                },
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
                        text: 'Already have an account? ',
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
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Go(context).to(routeName: SigninView.routeName);
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
