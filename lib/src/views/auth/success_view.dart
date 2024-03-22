import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/app/home.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/header_widget.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

import '../utils/components/app_button.dart';
import '../utils/enums.dart';

class SuccessView extends StatelessWidget {
  static const String routeName = '/SuccessView';
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimentions.k16),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const ImageViewer(imagePath: AppAsset.thumbsUpIcon),
                HeaderWidget(context,
                    centerItems: true,
                    title: 'Congratulations, Jesse Dan',
                    subtitle:
                        'You’ve completed the onboarding, you can start using'),
                AppDimentions.verticalSpace(AppDimentions.k20),
                AppButton(
                  buttonType: ButtonType.LONG_BTN,
                  flex: true,
                  applyMargin: true,
                  btnText: 'Get Started',
                  onTap: () {
                    Go(context).to(routeName: HomeView.routeName);
                  },
                )
              ]),
        ),
      ),
    );
  }
}
