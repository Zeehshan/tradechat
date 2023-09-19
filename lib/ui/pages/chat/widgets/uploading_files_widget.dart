import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

import '../../../../controllers/controllers.dart';

class UploadingfilesWidget extends GetView<ChatController> {
  const UploadingfilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: controller.progressData.keys
              .toList()
              .map((e) => controller.progressData[e] == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: 60,
                              child: GestureDetector(
                                  onTap: () {
                                    OpenFile.open(e);
                                  },
                                  child: Row(
                                    children: [
                                      Builder(builder: (context) {
                                        if (e.toLowerCase().contains('png') ||
                                            e.toLowerCase().contains('jpg') ||
                                            e.toLowerCase().contains('jpeg')) {
                                          return Row(
                                            children: [
                                              Image.file(
                                                File(e),
                                                width: 60,
                                              ),
                                            ],
                                          );
                                        } else if (e
                                            .toLowerCase()
                                            .contains('mp4')) {
                                          return Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.video_file,
                                              color: Colors.white,
                                            ),
                                          );
                                        }

                                        return Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            path.extension(e).toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                          ),
                                        );
                                      }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          path.basename(e),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(fontSize: 13),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          if (controller.progressData[e] != null &&
                              controller.seningFiles.value)
                            const IndicatorWidget(),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ))
              .toList(),
        ));
  }

  checkFileType(String file) {
    switch (file.toLowerCase()) {
      case 'pdf':
        return 'pdf';
      case 'jpg':
      case 'jpeg':
      case 'png':
        return 'image';
      case 'mp4':
        return 'video';
    }
  }
}

class IndicatorWidget extends StatefulWidget {
  const IndicatorWidget({super.key});

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: controller.value,
      minHeight: 2,
      color: Theme.of(context).primaryColor,
      semanticsLabel: 'Linear progress indicator',
    );
  }
}
