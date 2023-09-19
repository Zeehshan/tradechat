import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/controllers.dart';
import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';

class LatestMessagedWidget extends StatelessWidget {
  final ChatModel message;
  const LatestMessagedWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = Get.find<AuthenticationController>();
    late UserModel user;
    if (message.user1Id == currentUser.profile.value.user?.id) {
      user = message.user2;
    } else {
      user = message.user1;
    }
    String date = '';
    final DateTime messageData =
        DateTime.parse(message.message.first.createdAt);

    date =
        '${DateFormat.MMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Expanded(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${user.firstName} ${user.lastName}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Text.rich(
                  //   TextSpan(children: [
                  //     // WidgetSpan(
                  //     //     child: Padding(
                  //     //   padding: const EdgeInsets.only(
                  //     //     bottom: 3.5,
                  //     //     right: 4,
                  //     //   ),
                  //     //   child: FaIcon(FontAwesomeIcons.timeline),
                  //     // )),
                  //     TextSpan(text: date)
                  //   ]),
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .displayLarge!
                  //       .copyWith(fontSize: 12),
                  // ),

                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                message.message.first.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: const Color.fromARGB(255, 140, 138, 138),
                    ),
              ),
            ],
          ),
          Positioned(
              top: 10,
              right: 12,
              child: TimeWidget(
                createdAt: messageData,
                color: const Color.fromARGB(255, 140, 138, 138),
              )),
        ],
      ),
    );
  }
}
