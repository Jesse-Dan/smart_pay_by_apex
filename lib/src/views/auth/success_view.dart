import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/app/home/home.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/header_widget.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

import '../utils/components/app_button.dart';
import '../utils/enums.dart';

class SuccessView extends StatefulWidget {
  static const String routeName = '/SuccessView';
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  int _timerCount = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
        });
      } else {
        timer.cancel();
        Go(context).to(routeName: HomeView.routeName);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              HeaderWidget(
                context,
                centerItems: true,
                title: 'Congratulations, Jesse Dan',
                subtitle:
                    'You’ve completed the onboarding, you can start using',
              ),
              AppDimentions.verticalSpace(AppDimentions.k20),
              AppButton(
                buttonType: ButtonType.LONG_BTN,
                flex: true,
                applyMargin: true,
                btnText:
                    'Taking you Home in $_timerCount ${_timerCount <= 1 ? 'sec' : 'secs'} ',
                onTap: () {
                  Go(context).to(routeName: HomeView.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
