import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import '../views/auth/onboarding/onboarding_view.dart';
import '../views/auth/splash_screen_vew.dart';

/// Manage Route with Custom Built Navigation Plugin
/// [https://pub.dev/packages/go_navigator]
MaterialPageRoute<void> goNavigator(settings) => GoNavigator(
      initialRoute: const SplashScreenView(),
      routes: {
        SplashScreenView.routeName: (context, args) => const SplashScreenView(),
        OnboardingView.routeName: (context, args) => const OnboardingView()
      },
    ).generateRoute(settings);
