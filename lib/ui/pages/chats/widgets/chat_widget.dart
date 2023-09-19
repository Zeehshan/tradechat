import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/warning_alert_dialog.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';
import 'widgets.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chat;

  const ChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final currentUser = Get.find<AuthenticationController>();
    final chatControoler = Get.find<ChatsController>();
    late UserModel user;
    if (chat.user1Id == currentUser.profile.value.user?.id) {
      user = chat.user2;
    } else {
      user = chat.user1;
    }
    if (chat.message.isNotEmpty) {
      return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(12),
          //     boxShadow: [
          //       BoxShadow(
          //           blurRadius: 1,
          //           spreadRadius: 1,
          //           color: Colors.grey.withOpacity(.2),
          //           offset: const Offset(0, 0))
          //     ]),
          child: TextButton(
            onLongPress: () {
              final RenderBox renderBox =
                  Overlay.of(context).context.findRenderObject()! as RenderBox;
              Offset offset = renderBox.localToGlobal(const Offset(1, 20));
              SubMenue.showPopupMenu(
                  context: context,
                  offset: offset,
                  onDelete: () async {
                    final istrue = await WarningAlertDialog.warningAlertDialog(
                        context: context,
                        message:
                            'Are you confirmed ?, once deleted cannot be recover');
                    if (istrue == true) {
                      chatControoler.deleChat(chat.id);
                    }
                  });
            },
            onPressed: () => Get.toNamed(AppRoutes.chatPage, arguments: [
              ChatPageArgument(
                  chatId: chat.id,
                  peerAvatar: user.profilePic,
                  peerId: user.id,
                  peerName: '${user.firstName} ${user.lastName}',
                  username: user.username)
            ]),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.only(left: 10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  // decoration: BoxDecoration(
                  //     boxShadow: [
                  //       // BoxShadow(
                  //       //     blurRadius: 2,
                  //       //     spreadRadius: 2,
                  //       //     color: Colors.grey.withOpacity(.6),
                  //       //     offset: const Offset(0, 0))
                  //     ],
                  //     borderRadius: BorderRadius.circular(4),
                  //     border:
                  //         Border.all(color: Theme.of(context).primaryColor)),
                  child: UserImageWidget(
                    width: 50,
                    height: 50,
                    borderRadius: 4,
                    imageUrl: Tools.displayImage(user.profilePic),
                    userId: user.id.toString(),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                LatestMessagedWidget(
                  message: chat,
                )
              ],
            ),
          ));
    }
    return Container();
  }
}
