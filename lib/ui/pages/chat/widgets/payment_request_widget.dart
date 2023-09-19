import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class PaymentRequestWidget extends StatelessWidget {
  final UserModel user;
  final MessageModel message;
  final bool isSent;
  const PaymentRequestWidget(
      {super.key,
      required this.user,
      required this.message,
      required this.isSent});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              !isSent ? ThemeConfig.chatRedColor : ThemeConfig.chatGreenColor),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.leftRight,
                      color: Colors.white,
                    ),
                    Text.rich(
                      TextSpan(
                          text: 'By: ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white, fontSize: 13),
                          children: [
                            TextSpan(
                              text: user.username ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white, fontSize: 13),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              UserImageWidget(
                  width: 35,
                  height: 35,
                  borderRadius: 100,
                  userId: user.id.toString(),
                  imageUrl: Tools.displayImage(user.profilePic)),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            color: Colors.white,
            height: 0,
            thickness: 1.2,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '🇨🇳',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24),
              ),
              const Icon(
                Icons.currency_yuan,
                color: Colors.white,
                size: 28,
              ),
              Text(
                Tools.numberFormat(message.paymentRequest!.amount),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 28, color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                message.paymentRequest?.status == 'pending'
                    ? Icons.hourglass_top
                    : message.paymentRequest?.status == 'accepted'
                        ? Icons.check
                        : Icons.clear,
                color: Colors.white,
                size: 22,
              ),
              if (message.paymentRequest?.status == 'pending' && isSent)
                Text.rich(TextSpan(
                    text: 'Status: waiting ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: chatController.argument.peerName,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                      const TextSpan(text: ' to accept')
                    ])),
              if (message.paymentRequest?.status == 'accepted' && isSent)
                Text.rich(TextSpan(
                    text: 'Status: paid by: ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: chatController.argument.username,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ])),
              if (message.paymentRequest?.status == 'rejected' && isSent)
                Text.rich(TextSpan(
                    text: 'Status: rejected by: ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: chatController.argument.username,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ])),
              if (message.paymentRequest?.status == 'pending' && !isSent)
                Text.rich(TextSpan(
                    text: 'Status: waiting ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'for you',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                      const TextSpan(text: ' to accept')
                    ])),
              if (message.paymentRequest?.status == 'accepted' && !isSent)
                Text.rich(TextSpan(
                    text: 'Status: paid by: ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'you',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ])),
              if (message.paymentRequest?.status == 'rejected' && !isSent)
                Text.rich(TextSpan(
                    text: 'Status: rejected by: ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'you',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: Colors.white),
                      ),
                    ])),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 10,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              if (isSent)
                Expanded(
                    child: Text(
                  'Money will be added to your personal RMB account (+)',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 13, color: Colors.white),
                )),
              if (!isSent)
                Expanded(
                    child: Text(
                  'Money will be deducted from your RMB personal account (-)',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 13, color: Colors.white),
                )),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TimeWidget(
              createdAt: DateTime.parse(message.createdAt),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
