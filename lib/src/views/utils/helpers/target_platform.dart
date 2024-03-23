import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

TargetPlatform getDevice() {
  try {
    return defaultTargetPlatform == TargetPlatform.android
        ? TargetPlatform.android
        : TargetPlatform.iOS;
  } on PlatformException catch (exception) {
    // Added 'catch' before exception
    print('Error determining platform: $exception');
    return TargetPlatform
        .fuchsia; // Or return a different default platform like 'unknown'
  }
}

String getPlatformString() {
  TargetPlatform platform = getDevice();
  return kIsWeb
      ? 'web'
      : platform == TargetPlatform.android
          ? 'android'
          : platform == TargetPlatform.iOS
              ? 'ios'
              : 'unidentified device';
}
