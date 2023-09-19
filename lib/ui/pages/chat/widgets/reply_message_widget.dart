import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import 'package:path/path.dart' as path;

import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ReplyMessageWidget extends GetView<ChatController> {
  const ReplyMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.messageActionId.value == -1
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: ReplyMessageWidgetV2(
                        fromMe: false,
                        message: controller.messages.firstWhereOrNull(
                            (element) =>
                                element.id ==
                                controller.messageActionId.value)!,
                        peerName: controller.argument.peerName)),
                IconButton(
                    onPressed: () => controller.replyChanged(null),
                    icon: const Icon(Icons.clear))
              ],
            ),
          ));
  }
}

class ReplyMessageWidgetV2 extends StatelessWidget {
  final MessageModel message;
  final String peerName;
  final bool fromMe;
  const ReplyMessageWidgetV2(
      {super.key,
      required this.message,
      required this.peerName,
      required this.fromMe});

  @override
  Widget build(BuildContext context) {
    Widget _typeWidget(MessageModel message) {
      if (message.fileUrl == null) {
        return Text(
          message.text,
          maxLines: 1,
          style: Theme.of(context).textTheme.displayMedium,
        );
      } else {
        final extension = path.extension(message.fileUrl!).toLowerCase();
        return fileIcon(extension, Colors.black26);
      }
    }

    final currentUser = Get.find<AuthenticationController>().profile.value.user;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 80,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                  color:
                      fromMe ? Colors.white : Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentUser?.id == message.senderId ? 'You' : peerName,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                          color: fromMe
                              ? Colors.white
                              : Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        _typeWidget(message),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            message.fileUrl == null
                                ? message.text
                                : text(message),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _endWidget(message),
          ],
        ),
      ),
    );
  }

  String text(MessageModel message) {
    final extension = path.extension(message.fileUrl!).toLowerCase();
    switch (extension.toLowerCase()) {
      case '.pdf':
        return path.basename(message.fileUrl!);
      case '.mp4':
        return path.basename(message.fileUrl!);
      case '.excel':
        return path.basename(message.fileUrl!);
      case '.jpeg':
      case '.jpg':
      case '.png':
        return 'Photo';
      default:
        return path.basename(message.fileUrl!);
    }
  }

  Widget _endWidget(MessageModel message) {
    if (message.fileUrl == null) {
      return Container();
    }
    final extension = path.extension(message.fileUrl!).toLowerCase();
    switch (extension.toLowerCase()) {
      case '.jpeg':
      case '.jpg':
      case '.png':
        return Container(
          width: 70,
          height: 70,
          margin: const EdgeInsets.all(6),
          child: NetworkImageWidget(
              boxFit: BoxFit.fitWidth,
              borderRadius: 12,
              imageUrl: Tools.displayImage(message.fileUrl!)),
        );
      default:
        return Container();
    }
  }
}
