import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../pages.dart';

class ScaffolWithNavbarWidget extends GetView<ScaffoldWithNavbarController> {
  const ScaffolWithNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            ChatsPage(),
            MyOrdersPage(),
            MyProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: false, //selected item
          showUnselectedLabels: false,
          selectedIconTheme: Theme.of(context).primaryIconTheme,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidMessage), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cartShopping), label: ''),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.person), label: ''),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
