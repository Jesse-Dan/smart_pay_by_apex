import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/views/app/home/home.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/create_new_password.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/password_recovery_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/recovery/verify_identity_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/signin_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/about_self_view/about_self_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/set_pin_view/set_pincode_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/signup_view/signup_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/success_view.dart';

import '../views/app/secret_history_view.dart';
import '../views/auth/onboarding/onboarding_view.dart';
import '../views/auth/signup/verify_view/verify_view.dart';
import '../views/auth/splash_screen_vew.dart';

/// Manage Route with Custom Built Navigation Plugin
/// [https://pub.dev/packages/go_navigator]
MaterialPageRoute<void> goNavigator(settings) => GoNavigator(
      initialRoute: const SplashScreenView(),
      routes: {
        SplashScreenView.routeName: (context, args) => const SplashScreenView(),
        OnboardingView.routeName: (context, args) => const OnboardingView(),
        PasswordRecoveryView.routeName: (context, args) =>
            const PasswordRecoveryView(),
        VerifyIdentityView.routeName: (context, args) =>
            const VerifyIdentityView(),
        CreateNewPasswordView.routeName: (context, args) =>
            const CreateNewPasswordView(),
        SigninView.routeName: (context, args) => const SigninView(),
        SignupView.routeName: (context, args) => const SignupView(),
        VerifyView.routeName: (context, args) =>
            VerifyView(email: args?.args[0]['email']),
        AboutSelfView.routeName: (context, args) =>
            AboutSelfView(email: args?.args[0]['email']),
        SetPincodeView.routeName: (context, args) => const SetPincodeView(),
        SuccessView.routeName: (context, args) => const SuccessView(),
        HomeView.routeName: (context, args) => HomeView(),
        SecretHistoryView.routeName: (context, args) =>
            const SecretHistoryView(),
      },
    ).generateRoute(settings);
