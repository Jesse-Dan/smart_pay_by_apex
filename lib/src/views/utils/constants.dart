import 'package:smart_pay_by_apex/src/views/auth/signin/signin_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/signup_view/signup_view.dart';

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
  static const String secretHistory = 'SECRET-HISTORY';


  /// API VALUES
  /// [0] - BASE URL
  static const String baseUrl = 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1/';
}
