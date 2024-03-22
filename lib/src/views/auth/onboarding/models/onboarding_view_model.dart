import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';

class OnboardingViewModel {
  final String devicePath;
  final String illustrationPath;
  final String title;
  final String description;

  OnboardingViewModel(
      {required this.devicePath,
      required this.illustrationPath,
      required this.title,
      required this.description});

  static List<OnboardingViewModel> onboardingViewModel = [
    OnboardingViewModel(
        devicePath: AppAsset.device1,
        illustrationPath: AppAsset.illustration1,
        title: 'The Safest and most Trusted Finance app',
        description:
            'Finance starts here. we are here to help you tract and deal with speeding up your transactions.'),
    OnboardingViewModel(
        devicePath: AppAsset.device2,
        illustrationPath: AppAsset.illustration2,
        title: 'Fast Transaction Proccessing',
        description:
            'Pay your bills easily with just a few steps. Paying your bills just became fast and efficient.'),
  ];
}
