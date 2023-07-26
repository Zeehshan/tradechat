import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/bindings/bindings.dart';
import '../configs/routes/app_routes.dart';
import '../ui/pages/pages.dart';

class ScaffoldWithNavbarController extends GetxController {
  static ScaffoldWithNavbarController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>[
    AppRoutes.chats,
    AppRoutes.myOrders,
    AppRoutes.myProfile
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.chats) {
      return GetPageRoute(
        settings: settings,
        page: () => const ChatsPage(),
        binding: ChatsBinding(),
      );
    }

    if (settings.name == AppRoutes.myOrders) {
      return GetPageRoute(
        settings: settings,
        page: () => const MyOrdersPage(),
        // binding: MyOrdersBinding(),
      );
    }

    if (settings.name == AppRoutes.myProfile) {
      return GetPageRoute(
        settings: settings,
        page: () => const MyProfilePage(),
        binding: MyProfileBinding(),
      );
    }

    return null;
  }
}
