import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/logic/client_options/client.dart';
import 'package:smart_pay_by_apex/src/logic/interface/app_interface.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';

@immutable
class AppRepository implements AppInterface {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<(Map<String, dynamic>?, ResponseType, String)> getSecret(
      {Map<String, dynamic>? queryParams}) {
    var res =
        _apiClient.sendRequest(endpoint: 'dashboard', authenticated: true);
    return res;
  }
}
