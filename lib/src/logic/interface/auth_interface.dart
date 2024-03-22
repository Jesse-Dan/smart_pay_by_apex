import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/get_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/verify_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../../views/auth/models/payloads/signin_payload.dart';
import '../../views/auth/signup/signup_view/model/signup_payload.dart';

abstract class AuthInterface {
  Future<(Map<String, dynamic>?, ResponseType, String)> login(
      {SignInPayload signInPayload});
  Future<(Map<String, dynamic>?, ResponseType, String)> signup(
      {SignUpPayload signUpPayload});
  Future<(Map<String, dynamic>?, ResponseType, String)> verifyToken(
     {VerifyTokenPayload verifyTokenPayload});
  Future<(Map<String, dynamic>?, ResponseType, String)> getToken(
      {GetTokenPayload? getTokenPayload});
  Future<(Map<String, dynamic>?, ResponseType, String)> logout(
      {Map<String, dynamic>? queryParams});
}
