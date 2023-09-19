// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/routes/app_routes.dart';
import '../../controllers/chat_controller.dart';
import '../../controllers/chats_controller.dart';
import '../../data/repositories/app_api_repository.dart';
import '../../models/models.dart';
import '../pages/pages.dart';
import '../widgets/widgets.dart';

class CreateChatDialog {
  static createChatDialog(
      {required BuildContext context, required UserModel user}) {
    return showGeneralDialog<dynamic>(
      barrierLabel: 'Label',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, anim1, anim2) => Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
                child: CreateChatAlertWidget(
              user: user,
            )),
          )),
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }
}

class CreateChatAlertWidget extends StatefulWidget {
  final UserModel user;
  const CreateChatAlertWidget({super.key, required this.user});

  @override
  State<CreateChatAlertWidget> createState() => _CreateChatAlertWidgetState();
}

class _CreateChatAlertWidgetState extends State<CreateChatAlertWidget> {
  bool loading = false;
  final chatsController = Get.find<ChatsController>();
  createChat() async {
    try {
      setState(() {
        loading = true;
      });
      final int chatId = await AppApiRepostory().createChat(
        id: widget.user.id,
      );
      setState(() {
        loading = false;
      });
      chatsController.loadChats();
      Navigator.pop(context);
      Get.toNamed(AppRoutes.chatPage, arguments: [
        ChatPageArgument(
            chatId: chatId,
            peerAvatar: widget.user.profilePic,
            peerId: widget.user.id,
            peerName: '${widget.user.firstName} ${widget.user.lastName}',
            username: widget.user.username)
      ]);
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Are you sure you want to start a chat with ${widget.user.firstName} ${widget.user.lastName}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        if (loading) const LoadingWidget(),
        if (!loading)
          Row(
            children: [
              Expanded(
                child: ElevatedButtonWidget(
                    height: 40,
                    backgroundColor: Colors.transparent,
                    borderSide: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Theme.of(context).primaryColor),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButtonWidget(
                    height: 40,
                    onPressed: () => createChat(),
                    child: Text(
                      'Create',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.white),
                    )),
              ),
            ],
          ),
      ],
    );
  }
}
