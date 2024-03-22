import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:smart_pay_by_apex/src/views/utils/constants.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/Theme/Dark.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/Theme/Light.dart';
import 'logic/routes.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return InAppNotification(child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme:lightTheme ,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (settings) => goNavigator(settings),
    ),);
  }
}
