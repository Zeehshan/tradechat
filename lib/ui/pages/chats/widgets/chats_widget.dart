import 'package:flutter/material.dart';
import 'package:tradechat/ui/pages/chats/widgets/chat_widget.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatWidget();
      },
    );
  }
}
