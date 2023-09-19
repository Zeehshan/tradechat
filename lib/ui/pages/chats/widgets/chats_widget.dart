import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/assets_path.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';
import 'widgets.dart';

class ChatsWidget extends GetView<ChatsController> {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: ((data?['chats'] ?? []) as List<ChatModel>).length,
        itemBuilder: (context, index) {
          return ChatWidget(
            chat: ((data?['chats'] ?? []) as List<ChatModel>)[index],
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 25 + 60),
            child: Divider(
              height: 0,
            ),
          );
        },
      ),
      onEmpty: const EmotyChatwidget(),
      onError: (e) => const EmotyChatwidget(),
      onLoading: const Padding(
        padding: EdgeInsets.all(30),
        child: LoadingWidget(),
      ),
    );
  }
}

class EmotyChatwidget extends StatelessWidget {
  const EmotyChatwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Image.asset(
          AssetsPath.chatEmpty,
          height: 120,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "It's nice to chat with someone",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Pick a person from contact list\nand start a conversation',
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
