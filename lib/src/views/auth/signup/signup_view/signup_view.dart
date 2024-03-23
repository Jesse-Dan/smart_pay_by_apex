// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/logic/handler/base_handler.dart';
import 'package:smart_pay_by_apex/src/logic/mixins/validator.dart';
import 'package:smart_pay_by_apex/src/views/auth/models/auth_response.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/signin_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/get_token_bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/verify_view.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../../../../logic/handler/handlers/error_handler.dart';
import '../../../../logic/handler/handlers/loading_handler.dart';
import '../../../../logic/handler/handlers/success_handler.dart';
import '../../../../logic/services/local_storage_service.dart';
import '../../../utils/components/app_horizontal_divider.dart';
import '../../../utils/components/back_button.dart';
import '../../../utils/components/header_widget.dart';
import '../../../utils/constants.dart';
import '../../signin/sign_in_with_pin.dart';
import '../about_self_view/about_self_view.dart';
import '../verify_view/verify_bloc/index.dart';

class SignupView extends StatefulWidget {
  static const String routeName = '/SignupView';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with ValidatorMixin {
  final emailCtl = TextEditingController();

  bool showPassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


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
          child: Form(
            key: formKey,
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
                AppTextField(
                  hintText: 'Email',
                  controller: emailCtl,
                  validator: (val) => validateEmail(val!),
                ),
                AppDimentions.verticalSpace(AppDimentions.large),
                AppButton(
                  buttonType: ButtonType.LONG_BTN,
                  flex: true,
                  applyMargin: false,
                  btnText: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      /// Request  Token
                      final getTokenBloc = GetTokenBloc(InitialGetTokenState());

                      getTokenBloc.add(LoadGetTokenEvent(
                          getTokenPayload: GetTokenPayload(
                              email: emailCtl.text)));

                      /// Go to verify Screen
                      Go(context).to(
                          routeName: VerifyView.routeName,
                          args: GoArgs(args: [
                            {
                              'email': emailCtl.text,
                              'route': AboutSelfView.routeName
                            }
                          ]));
                    }
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
                                String? previousUserPin =
                                    LocalStorageService.getString(
                                        Constants.securePin(
                                            User.getPresentUser()?.email));
                                String? userBearerToken =
                                    LocalStorageService.getString(
                                        Constants.bearerToken);

                                User? user = User.getPresentUser();
                                if (!(previousUserPin.isEmpty &&
                                    userBearerToken.isEmpty &&
                                    user != null)) {
                                  Go(context).toAndReplaceAllNamedRoute(
                                      routeName:
                                          SignInWithPincodeView.routeName);
                                } else {
                                  Go(context)
                                      .to(routeName: SigninView.routeName);
                                }
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
