import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/back_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

import '../../logic/services/local_storage_service.dart';
import '../auth/models/auth_response.dart';
import '../utils/constants.dart';
import '../utils/style/app_colors.dart';
import 'home/home.dart';

class SecretHistoryView extends StatefulWidget {
  static const String routeName = '/SecretHistoryView';

  const SecretHistoryView({super.key});

  @override
  State<SecretHistoryView> createState() => _SecretHistoryViewState();
}

class _SecretHistoryViewState extends State<SecretHistoryView> {
  List getHistory() {
    return LocalStorageService.getList(
        Constants.secretHistory(User.getPresentUser()?.email ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    Logger.log(tag: Tag.DEBUG, message: 'History: ${getHistory()} ');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppDimentions.k18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            backButton(context),
            AppDimentions.verticalSpace(),
            Expanded(
              child: getHistory().isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ImageViewer(imagePath: AppAsset.recoveryLock),
                          AppDimentions.verticalSpace(),
                          Text(
                            'No secrets yet..',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kgrey900),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: getHistory().length,
                      itemBuilder: (ctx, i) {
                        return SecretCard(
                          secret: getHistory()[i],
                          onPressed: () {
                            var allSecrete = LocalStorageService.getList(
                                Constants.secretHistory(
                                    User.getPresentUser()?.email));

                            /// Stop duplicate entry
                            if (allSecrete.contains(allSecrete[i])) {
                              allSecrete.add(allSecrete[i]);
                            }

                            LocalStorageService.setList(
                                Constants.secretHistory(
                                    User.getPresentUser()?.email),
                                allSecrete);
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
