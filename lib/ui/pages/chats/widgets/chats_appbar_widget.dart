import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';

class ChatsAppbarWidget extends GetView<ChatsController> {
  const ChatsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffededed),
      elevation: 3,
      title: controller.obx(
        (state) => Text(
          'Chats (${((state?['chats'] ?? []) as List<ChatModel>).length})',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onEmpty: Text(
          'Chats',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onError: (e) => Text(
          'Chats',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onLoading: Text(
          'Chats',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
