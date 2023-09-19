import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../painters/painters.dart';
import '../../../sheets/sheets.dart';
import '../../../widgets/widgets.dart';
import 'widgtes.dart';

class SentMessage extends StatelessWidget {
  final MessageModel message;
  const SentMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authUser = Get.find<AuthenticationController>().profile.value.user;
    final chatController = Get.find<ChatController>();
    final messageTextGroup = Flexible(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message.fileUrl != null && message.isDeleted != true
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.replyTo != null)
                        Container(
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 4),
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .6),
                          child: ReplyMessageWidgetV2(
                            fromMe: true,
                            message: message.replyTo!,
                            peerName: chatController.argument.peerName,
                          ),
                        ),
                      FileWidget(
                        message: message,
                        fromCurrentUser: true,
                      ),
                    ],
                  ),
                )
              : Flexible(
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 300, minWidth: 100),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (message.replyTo != null &&
                            message.isDeleted != true)
                          Container(
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 4),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .6),
                            child: ReplyMessageWidgetV2(
                              fromMe: true,
                              message: message.replyTo!,
                              peerName: chatController.argument.peerName,
                            ),
                          ),
                        Text(
                          message.isDeleted == true
                              ? 'This message has been deleted'
                              : message.text,
                          style: TextStyle(
                              fontStyle: message.isDeleted == true
                                  ? FontStyle.italic
                                  : null,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
          CustomPaint(painter: TrianglePainter(Theme.of(context).primaryColor)),
        ],
      ),
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 18, top: 1, bottom: 1),
      child: message.paymentRequestId != null && message.isDeleted != true
          ? GestureDetector(
              onLongPress: message.isDeleted == true
                  ? null
                  : () {
                      MessageOptionsSheet.messageOptionsSheet(
                          context: context, message: message);
                    },
              child: PaymentRequestWidget(
                message: message,
                user: authUser!,
                isSent: true,
              ),
            )
          : GestureDetector(
              onLongPress: message.isDeleted == true
                  ? null
                  : () {
                      MessageOptionsSheet.messageOptionsSheet(
                          context: context, message: message);
                    },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      messageTextGroup,
                    ],
                  ),
                  TimeWidget(
                    createdAt: DateTime.parse(message.createdAt),
                  ),
                ],
              ),
            ),
    );
  }
}
