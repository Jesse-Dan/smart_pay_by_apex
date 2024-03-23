import '../auth/signup/signup_view/signup_view.dart';

/// HOLDS DATA THAT IS CONSTANT THROUGH OUT THE APP
abstract class Constants {
  ///CONSTANT STRINGS
  static const String appName = 'SmartPay-By-APEX';

  /// CONFIG
  static const Duration splashScreenDuration = Duration(seconds: 3);

  static const Duration notifierDuration = Duration(seconds: 40);

  /// TO BE USED FOR TESTS TO CHOOSE
  static const String routeAfterSplashScreen = SignupView.routeName;

  /// STORAGE KEYS
  static const String bearerToken = 'BEARER-TOKEN';
  static String secretHistory(email) => 'SECRET-HISTORY#$email';
  static String securePin(email) => 'SECURE-PIN#$email';
  static const String userKey = 'USER-KEY';
  static String secureToken(email) => 'SECURE-Token#$email';

  /// API VALUES
  /// [0] - BASE URL
  static const String baseUrl =
      'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/';
}
