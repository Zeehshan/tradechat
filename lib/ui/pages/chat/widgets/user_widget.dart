import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';

class UserWidgets extends GetView<ChatController> {
  const UserWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: UserImageWidget(
            imageUrl: controller.argument.peerAvatar,
            width: 44,
            height: 44,
            borderRadius: 100,
            userId: controller.argument.peerId.toString(),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          controller.argument.peerName,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
