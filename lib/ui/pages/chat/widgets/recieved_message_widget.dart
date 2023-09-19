// ignore_for_file: use_build_context_synchronously

import 'dart:math' as math; // import this

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../dialogs/dialogs.dart';
import '../../../painters/painters.dart';
import '../../../sheets/sheets.dart';
import '../../../widgets/widgets.dart';
import 'widgtes.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final MessageModel message;
  const ReceivedMessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    final auth = Get.find<AuthenticationController>();
    final messageTextGroup = Flexible(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: CustomPaint(
              painter: TrianglePainter(Colors.grey[300]!),
            ),
          ),
          message.fileUrl != null && message.isDeleted != true
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
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
                            fromMe: false,
                            message: message.replyTo!,
                            peerName: chatController.argument.peerName,
                          ),
                        ),
                      FileWidget(
                        message: message,
                        fromCurrentUser: false,
                      ),
                    ],
                  ),
                )
              : Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    constraints:
                        const BoxConstraints(maxWidth: 300, minWidth: 100),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(18),
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
                              fromMe: false,
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
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PaymentRequestWidget(
                    message: message,
                    user: UserModel(
                        username: chatController.argument.username,
                        id: chatController.argument.peerId,
                        firstName: chatController.argument.peerName,
                        updatedAt: chatController.argument.username,
                        profilePic: chatController.argument.peerAvatar),
                    isSent: false,
                  ),
                  if (message.paymentRequest?.status == 'pending')
                    const SizedBox(
                      height: 3,
                    ),
                  if (message.paymentRequest?.status == 'pending')
                    ElevatedButtonWidget(
                      height: 32,
                      width: 80,
                      backgroundColor: ThemeConfig.chatGreenColor,
                      borderRadius: 4,
                      onPressed: () async {
                        final String? password =
                            await InputPaymentDialog.inputPaymentDialog(
                                context: context,
                                message: 'Enter payment password');
                        if (password != null &&
                            password ==
                                auth.profile.value.user?.settings?.password) {
                          PayingAlertDialog.payingAlertDialog(
                              context: context,
                              username: chatController.argument.username ?? '',
                              message: message);
                        } else {
                          SnackBarWidget().showError(
                              context: context,
                              error: 'Payment password not matched');
                        }
                      },
                      child: Text(
                        'Accept',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ),
                ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
