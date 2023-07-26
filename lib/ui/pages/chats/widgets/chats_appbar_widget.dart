import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tradechat/configs/routes/app_routes.dart';

class ChatsAppbarWidget extends StatelessWidget {
  const ChatsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3,
      title: Text(
        'Chats',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
          padding: EdgeInsets.zero,
          onPressed: () => Get.toNamed(AppRoutes.contacts),
          icon: FaIcon(
            FontAwesomeIcons.plus,
            size: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
