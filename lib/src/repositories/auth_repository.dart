import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/logic/client_options/client.dart';
import 'package:smart_pay_by_apex/src/logic/interface/auth_interface.dart';
import 'package:smart_pay_by_apex/src/logic/services/local_storage_service.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/signup_view/model/signup_payload.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/verify_view/model/verify_token_payload.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

import '../views/auth/models/payloads/signin_payload.dart';
import '../views/auth/signup/verify_view/model/get_token_payload.dart';

@immutable
class AuthRepository implements AuthInterface {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getToken(
      {GetTokenPayload? getTokenPayload}) {
    var res = _apiClient.sendRequest(
        endpoint: 'auth/email',
        method: HttpMethod.post,
        body: getTokenPayload?.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> login(
      {SignInPayload? signInPayload}) {
    var res = _apiClient.sendRequest(
        endpoint: 'auth/login',
        method: HttpMethod.post,
        body: signInPayload?.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> logout(
      {Map<String, dynamic>? queryParams}) {
    var res = _apiClient.sendRequest(
      endpoint: 'auth/logout',
      method: HttpMethod.post,
    );
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> signup(
      {SignUpPayload? signUpPayload}) {
    var res = _apiClient.sendRequest(
        endpoint: 'auth/register',
        method: HttpMethod.post,
        body: signUpPayload?.toJson());
    return res;
  }

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> verifyToken(
      {VerifyTokenPayload? verifyTokenPayload}) {
    var res = _apiClient.sendRequest(
        endpoint: 'auth/email/verify',
        method: HttpMethod.post,
        body: verifyTokenPayload?.toJson());
    return res;
  }
}
