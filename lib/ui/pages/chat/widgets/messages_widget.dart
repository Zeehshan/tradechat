import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';
import 'widgtes.dart';

class MessagesWidget extends GetView<ChatController> {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Get.find<AuthenticationController>().profile.value.user;
    return controller.obx(
      (messgaes) => Expanded(
        child: Builder(builder: (context) {
          // List<MessageModel> messages0 = messgaes ?? [];

          // Map<String, List<MessageModel>> groupMessagesByDate() {
          //   Map<String, List<MessageModel>> groupedMessages = {};
          //   for (var message in messages0) {
          //     final dateKey =
          //         '${message.timeStamp.year}-${message.timeStamp.month < 10 ? '0${message.timeStamp.month}' : message.timeStamp.month}-${message.timeStamp.day < 10 ? '0${message.timeStamp.day}' : message.timeStamp.day}';
          //     if (!groupedMessages.containsKey(dateKey)) {
          //       groupedMessages[dateKey] = [];
          //     }
          //     groupedMessages[dateKey]!.add(message);
          //   }
          //   return groupedMessages;
          // }

          // final groupedMessages = groupMessagesByDate();
          // final dateKeys = groupedMessages.keys.toList()
          //   ..sort((a, b) => b.compareTo(a));
          return ListView.builder(
            controller: controller.scroll,
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              final message = messgaes![index];
              if (message.senderId == currentUser?.id) {
                // Right (my message)

                return SentMessage(
                  message: message,
                );
              } else {
                // Left (peer message)

                return ReceivedMessageWidget(
                  message: message,
                );
              }
            },
            itemCount: messgaes?.length,
            reverse: true,
          );
        }),
      ),
      onLoading: const Expanded(child: LoadingWidget()),
      onEmpty: Expanded(child: Container()),
      onError: (error) => Expanded(child: Container()),
    );
  }
}
