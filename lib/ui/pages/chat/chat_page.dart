import 'package:flutter/material.dart';
import '../../painters/painters.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgtes.dart';

class ChatPageArgument {
  final String? peerAvatar;
  final int peerId;
  final String peerName;
  final int chatId;
  final String? username;
  const ChatPageArgument({
    required this.peerAvatar,
    required this.peerId,
    required this.peerName,
    required this.chatId,
    required this.username,
  });
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: const Color(0xffededed),
        backButtonCallback: () => Navigator.pop(context),
        title: const UserWidgets(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: DashedLinePainter(),
            ),
          ),
          const MessagesWidget(),
          const UploadingfilesWidget(),
          const ReplyMessageWidget(),
          const InputWidget(),
        ],
      ),
    );
  }
}
