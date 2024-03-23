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
import '../views/auth/signin/sign_in_with_pin.dart';
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
            VerifyIdentityView(email: args?.args[0]['email']),
        CreateNewPasswordView.routeName: (context, args) =>
            const CreateNewPasswordView(),
        SigninView.routeName: (context, args) => const SigninView(),
        SignupView.routeName: (context, args) => const SignupView(),
        VerifyView.routeName: (context, args) => VerifyView(
              email: args?.args[0]['email'],
              route: args?.args[0]['route'],
            ),
        AboutSelfView.routeName: (context, args) =>
            AboutSelfView(email: args?.args[0]['email']),
        SetPincodeView.routeName: (context, args) => SetPincodeView(
              name: args?.args[0]['name'],
              email: args?.args[0]['email'],
            ),
        SuccessView.routeName: (context, args) => SuccessView(
              name: args?.args[0]['name'],
            ),
        HomeView.routeName: (context, args) => const HomeView(),
        SecretHistoryView.routeName: (context, args) =>
            const SecretHistoryView(),
        SignInWithPincodeView.routeName: (context, args) =>
            const SignInWithPincodeView(),
      },
    ).generateRoute(settings);
