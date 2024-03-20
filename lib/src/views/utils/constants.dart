import 'package:smart_pay_by_apex/src/views/auth/onboarding/onboarding_view.dart';

/// HOLDS DATA THAT IS CONSTANT THROUGH OUT THE APP
abstract class Constants {
  static const String appName = 'SmartPay-By-APEX';
  static const Duration splashScreenDuration = Duration(seconds: 3);

  /// TO BE USED FOR TESTS TO CHOOSE
  static const String routeAfterSplashScreen = OnboardingView.routeName;
}