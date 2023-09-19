import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../pages/chat/widgets/widgtes.dart';
import '../widgets/widgets.dart';
import 'package:path/path.dart' as path;

import 'dialogs.dart';

class FileDialog {
  static fileDialog(
      {required BuildContext context, MessageModel? message, String? fileurl}) {
    showGeneralDialog<dynamic>(
      barrierLabel: 'Label',
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return GetBuilder(
            init: DownLoadController(),
            builder: (context) {
              return FileDialogWidget(
                message: message,
                fileurl: fileurl,
              );
            });
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

class FileDialogWidget extends GetView<DownLoadController> {
  final MessageModel? message;
  final String? fileurl;
  const FileDialogWidget({super.key, this.message, this.fileurl});

  @override
  Widget build(BuildContext context) {
    final file = message?.fileUrl ?? fileurl!;
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
          child: Obx(() => controller.loading.value
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Dlownloading',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const IndicatorWidget(),
                      // LinearPercentIndicator(
                      //   barRadius: const Radius.circular(100),
                      //   padding: EdgeInsets.zero,
                      //   percent: controller.progress.value,
                      //   progressColor: Theme.of(context).primaryColor,
                      //   backgroundColor:
                      //       Theme.of(context).colorScheme.onSecondaryContainer,
                      // ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).dividerColor),
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(.2),
                                  offset: const Offset(0, 0))
                            ]),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18.5, vertical: 26),
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
                              padding: const EdgeInsets.only(
                                  left: 18, right: 18, bottom: 25),
                              child: Row(
                                children: [
                                  fileIcon(path.extension(file), Colors.black),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    path.basename(file),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: Colors.black, fontSize: 14),
                                  ))
                                ],
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
                          if (file.contains('mp4') ||
                              file.contains('png') ||
                              file.contains('jpg') ||
                              file.contains('jpeg') ||
                              message == null)
                            Container()
                          else
                            Expanded(
                                child: ElevatedButtonWidget(
                                    borderRadius: 100,
                                    height: 46,
                                    backgroundColor: const Color(0xffD9D9D9),
                                    child: Text(
                                      'Add to order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      AddToOrgerDialog.addToOrderDialog(
                                          context: context, message: message!);
                                    })),
                          if (file.contains('mp4') ||
                              file.contains('png') ||
                              file.contains('jpg') ||
                              file.contains('jpeg'))
                            Container()
                          else
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
                                      'Download',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 14),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.downloadStart(file);
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                  ],
                ))),
    );
  }
}
