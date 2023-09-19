import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class PayingAlertDialog {
  static payingAlertDialog(
      {required BuildContext context,
      required String username,
      required MessageModel message}) {
    showGeneralDialog<dynamic>(
      barrierLabel: 'Label',
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return AppCloseDialogWidget(
          username: username,
          message: message,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }
}

class AppCloseDialogWidget extends StatelessWidget {
  final String username;
  final MessageModel message;
  const AppCloseDialogWidget(
      {super.key, required this.username, required this.message});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();

    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).dividerColor),
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(.2),
                        offset: const Offset(0, 0))
                  ]),
              margin:
                  const EdgeInsets.symmetric(horizontal: 18.5, vertical: 26),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 20,
                        constraints: const BoxConstraints(
                            maxHeight: 35,
                            maxWidth: 35,
                            minHeight: 35,
                            minWidth: 35),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.clear)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 25),
                    child: Text.rich(
                      TextSpan(text: 'Important!\n', children: [
                        const TextSpan(
                          text: 'You are about to pay\n',
                        ),
                        TextSpan(
                          text:
                              '¥ ${Tools.numberFormat(message.paymentRequest!.amount)} ',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        const TextSpan(text: 'to '),
                        TextSpan(
                          text: '$username\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        const TextSpan(
                          text:
                              'Do you confirm you want to proceed with this payment?',
                        ),
                      ]),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.5),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButtonWidget(
                        borderRadius: 100,
                        height: 46,
                        backgroundColor: const Color(0xffD9D9D9),
                        child: Text(
                          'No',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14, color: Colors.black),
                        ),
                        onPressed: () {
                          chatController.rejectedPaymentRequest(
                              message.paymentRequestId!, message.chatId);
                          Navigator.pop(context);
                        })),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButtonWidget(
                      borderRadius: 100,
                      height: 46,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      onPressed: () {
                        logger.d('called');
                        chatController.acceptedPaymentRequest(
                            message.paymentRequestId!, message.chatId, context);
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      )),
    );
  }
}
