import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  _SplashScreenViewState() {
    Timer(
      Constants.splashScreenDuration,
      () => Go(context).toAndReplaceAllNamedRoute(
        routeName: Constants.routeAfterSplashScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAsset.appLogo),
      ),
    );
  }
}
