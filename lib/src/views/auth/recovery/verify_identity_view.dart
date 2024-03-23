// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/create_new_password.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/components/app_button.dart';
import '../../utils/components/back_button.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/enums.dart';
import '../../utils/helpers/image_view_helper.dart';
import '../../utils/style/app_colors.dart';
import '../signup/verify_view/get_token_bloc/index.dart';
import '../signup/verify_view/model/get_token_payload.dart';
import '../signup/verify_view/verify_view.dart';

class VerifyIdentityView extends StatefulWidget {
  final String email;
  static const String routeName = '/VerifyIdentityView';
  const VerifyIdentityView({super.key, required this.email});

  @override
  State<VerifyIdentityView> createState() => _VerifyIdentityViewState();
}

class _VerifyIdentityViewState extends State<VerifyIdentityView> {
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
              AppDimentions.verticalSpace(AppDimentions.k26),
              const ImageViewer(imagePath: AppAsset.recoveryLock),
              HeaderWidget(
                context,
                title: 'Verify your identity',
                subTitleWidget: Text.rich(
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.20000000298023224,
                      color: AppColors.kgrey500),
                  textAlign: TextAlign.left,
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Where would you like '),
                      TextSpan(
                        text: 'Smartpay',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.20000000298023224,
                            color: AppColors.kprimary),
                      ),
                      const TextSpan(text: ' to send your security code?'),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.kgrey200,
                    borderRadius: BorderRadius.circular(AppDimentions.k16)),
                height: 88,
                padding: EdgeInsets.all(AppDimentions.k18),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ImageViewer(imagePath: AppAsset.check),
                    AppDimentions.horizontalSpace(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kgrey900),
                          ),
                          Text(
                            widget.email == null
                                ? ''
                                : '${widget.email.split('')[0]} *****@${widget.email.split('@')[1].split('.')[0]}.com ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kgrey500),
                          ),
                        ],
                      ),
                    ),
                    const ImageViewer(
                        height: 24, width: 24, imagePath: AppAsset.mail)
                  ],
                ),
              ),
              AppDimentions.verticalSpace(AppDimentions.k26 * 3.5),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                applyMargin: true,
                btnText: 'Continue',
                onTap: () {
                  /// Request  Token
                  final getTokenBloc = GetTokenBloc(const InitialGetTokenState());

                  getTokenBloc.add(LoadGetTokenEvent(
                      getTokenPayload: GetTokenPayload(email: widget.email, context: context)));

                  /// Go to verify Screen
                  Go(context).to(
                      routeName: VerifyView.routeName,
                      args: GoArgs(args: [
                        {'email': widget.email,'route':CreateNewPasswordView.routeName}
                      ]));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
