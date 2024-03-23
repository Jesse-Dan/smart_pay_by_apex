import 'package:smart_pay_by_apex/src/views/utils/constants.dart';

import '../../views/utils/enums.dart';
import '../services/local_storage_service.dart';

mixin ClientUtils {
  static BaseOptions getOptions({bool isAuth = true}) {
    String? bearerToken = LocalStorageService.getString(Constants.bearerToken);

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };

    if (isAuth) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    return BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      sendTimeout: isAuth ? null : const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      contentType: 'application/json',
      validateStatus: (status) {
        return status! >= 200 && status < 400;
      },
    );
  }
}

class BaseOptions {
  final String? baseUrl;
  final Map<String, String>? headers;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final String? contentType;
  final ResponseType? responseType;
  final bool Function(int?)? validateStatus;

  BaseOptions({
    this.baseUrl,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.contentType,
    this.responseType,
    this.validateStatus,
  });
}
