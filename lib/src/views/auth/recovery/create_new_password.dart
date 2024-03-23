// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/components/app_button.dart';
import '../../utils/components/back_button.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/enums.dart';
import '../../utils/helpers/image_view_helper.dart';
import '../../utils/style/app_colors.dart';

class CreateNewPasswordView extends StatefulWidget {
  static const String routeName = '/CreateNewPasswordView';
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  final newPasswordCtl = TextEditingController();
  final confirmPasswordCtl = TextEditingController();

  bool showPassword = true;
  bool showPassword2 = true;
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
                  title: 'Create New Password',
                  subtitle:
                      'Please, enter a new password below different from the previous password'),
              AppTextField(
                  hintText: 'Enter new password',
                  controller: newPasswordCtl,
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
                      .subtitle1!
                      .copyWith(
                          color: AppColors.kprimaryColor,
                          fontSize: newPasswordCtl.text.isEmpty ? 14 : 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: newPasswordCtl.text.isEmpty ? 1 : 3)),
              AppTextField(
                  hintText: 'Confirm password',
                  controller: confirmPasswordCtl,
                  textFieldType: TextFieldType.PASSWORD,
                  obscureText: showPassword2,
                  onChanged: (p0) {
                    setState(() {});
                  },
                  onSufficIconClicked: () {
                    setState(() {
                      showPassword2 = !showPassword2;
                    });
                  },
                  fieldTextStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color: AppColors.kprimaryColor,
                          fontSize: confirmPasswordCtl.text.isEmpty ? 14 : 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing:
                              confirmPasswordCtl.text.isEmpty ? 1 : 3)),
              AppDimentions.verticalSpace(AppDimentions.k26 * 3.5),
               AppButton(
            buttonType: ButtonType.LONG_BTN,
            flex: true,
            applyMargin: true,
            btnText: 'Create new password',
          )
            ],
          ),
        ),
      ),
    );
  }
}
