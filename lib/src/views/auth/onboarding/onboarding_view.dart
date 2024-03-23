import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

class OnboardingView extends StatefulWidget {
  static const String routeName = '/OnboardingScreen';
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: AppDimentions.k16),

          /// MAIN COLUMN
          child: Column(
            children: [
              /// SKIP BTN
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kpeachGreenColor),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              /// IMAGES
              Padding(
                // padding: EdgeInsets.only(
                // top: MediaQuery.of(context).size.height * 3 / 30),
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const ImageViewer(
                          // height: MediaQuery.of(context).size.height / 3,
                          width: 280,
                          fit: BoxFit.contain,
                          imagePath: AppAsset.device1),
                      ImageViewer(
                          height: MediaQuery.of(context).size.height / 6,
                          width: 292,
                          imagePath: AppAsset.illustration1),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
