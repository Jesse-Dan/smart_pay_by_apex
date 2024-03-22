import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/verify_identity_view.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/header_widget.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

import '../../utils/app_dimentions.dart';
import '../../utils/components/back_button.dart';
import '../../utils/enums.dart';
import '../../utils/style/app_colors.dart';

class PasswordRecoveryView extends StatefulWidget {
  static const String routeName = '/PasswordRecoveryView';
  const PasswordRecoveryView({super.key});

  @override
  State<PasswordRecoveryView> createState() => _PasswordRecoveryViewState();
}

class _PasswordRecoveryViewState extends State<PasswordRecoveryView> {
  final emailCtl = TextEditingController();
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
              HeaderWidget(context,
                  title: 'Passsword Recovery',
                  subtitle:
                      'Enter your registered email below to receive password instructions'),
              AppTextField(
                  hintText: 'Enter registered email', controller: emailCtl),
              AppDimentions.verticalSpace(AppDimentions.k26 * 3.5),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                applyMargin: false,
                btnText: 'Send me email',
                onTap: () {
                  Go(context).to(routeName: VerifyIdentityView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
