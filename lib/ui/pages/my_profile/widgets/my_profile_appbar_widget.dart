import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class MyProfileAppbarWidget extends StatelessWidget {
  const MyProfileAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthenticationController>();
    return SliverAppBar(
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffededed),
      elevation: 3,
      title: Text(
        'My Profile',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        IconButton(
            onPressed: () => _authController.logout(),
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
