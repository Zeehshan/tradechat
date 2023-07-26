import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'configs/bindings/bindings.dart';
import 'configs/routes/app_routes.dart';
import 'configs/routes/router.dart';
import 'configs/themes/themes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      initialRoute: AppRoutes.splash,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
