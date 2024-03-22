import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/auth/onboarding/models/onboarding_view_model.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../../utils/helpers/image_view_helper.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
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
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: ImageViewer(
                          imagePath: OnboardingViewModel
                              .onboardingViewModel[0].devicePath),
                    ),
                    Center(
                      child: ImageViewer(
                          imagePath: OnboardingViewModel
                              .onboardingViewModel[0].illustrationPath),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white,
                                Colors.white,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.6),
                                  spreadRadius: 100,
                                  offset: const Offset(-8, -4))
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppDimentions.verticalSpace(
                                AppDimentions.extraLarge),
                            Text(
                              OnboardingViewModel.onboardingViewModel[0].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Text(OnboardingViewModel
                                .onboardingViewModel[0].description),
                            AppButton()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
