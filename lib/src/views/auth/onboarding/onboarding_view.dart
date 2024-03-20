import 'package:flutter/material.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Stack(
              children: [
                
              ]
            )
            
          ]
        ),
      ),
    );
  }
}
