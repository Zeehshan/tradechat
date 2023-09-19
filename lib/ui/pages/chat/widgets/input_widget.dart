import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/assets_path.dart';
import '../../../../controllers/controllers.dart';
import 'widgtes.dart';

// class InputWidget extends StatefulWidget {
//   const InputWidget({super.key});

//   @override
//   State<InputWidget> createState() => _InputWidgetState();
// }

class InputWidget extends GetView<ChatController> {
  const InputWidget({super.key});

  // late TextEditingController textEditingController;
  // final SocketController socketController = Get.find<SocketController>();
  // final authenticationController = Get.find<AuthenticationController>();
  // final chatController = Get.find<ChatController>();
  // final arguments = Get.arguments[0] as ChatPageArgument;

  // @override
  // void initState() {
  //   super.initState();
  //   // textEditingController = TextEditingController();
  //   textEditingController.addListener(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // textEditingController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
      child: Obx(() => Row(
            children: [
              controller.seningFiles.value ||
                      controller.messageEditActionId.value != -1
                  ? const SizedBox(
                      width: 40,
                    )
                  : const MenueWidget(),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 150),
                  child: TextField(
                      maxLines: null,
                      controller: controller.messageTextController.value,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: 'Type Message...',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14, color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      )),
                ),
              ),
              IconButton(
                onPressed: !controller.canSendMessgae.value
                    ? null
                    : () {
                        controller.sendChatMessage();
                        Future.delayed(const Duration(milliseconds: 200), () {
                          controller.messageTextController.value.clear();
                          // chatController.loadMessages();
                        });
                      },
                icon: SvgPicture.asset(
                  AssetsPath.chat,
                  colorFilter: ColorFilter.mode(
                      !controller.canSendMessgae.value
                          ? Colors.grey
                          : Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn),
                ),
              )
            ],
          )),
    );
  }
}
