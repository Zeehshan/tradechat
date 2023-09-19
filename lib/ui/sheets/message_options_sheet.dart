import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class MessageOptionsSheet {
  static Future<MessageOptions?> messageOptionsSheet(
      {required BuildContext context, required MessageModel message}) async {
    return await showModalBottomSheet<MessageOptions?>(
      context: context,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReportOptionWidget(message: message);
      },
    );
  }
}

class ReportOptionWidget extends StatelessWidget {
  final MessageModel message;
  const ReportOptionWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();
    return IntrinsicHeight(
      child: RoundedCardWidget(
        width: double.infinity,
        child: Material(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 60,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ListTile(
                  onTap: () {
                    chatController.replyChanged(message.id);
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text(
                    'Reply',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                if (message.fileUrl == null)
                  ListTile(
                    onTap: () {
                      chatController.selectMessage(message.id);
                      Navigator.pop(context);
                    },
                    dense: true,
                    title: Text(
                      'Edit',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ListTile(
                  onTap: () {
                    chatController.deleteMessage(message);
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text(
                    'Delete',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
