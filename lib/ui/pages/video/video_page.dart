import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class VideoPageArguments {
  final String video;

  VideoPageArguments({required this.video});
}

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments[0] as VideoPageArguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(
        backButtonCallback: () => Navigator.pop(context),
        backgroundColor: Colors.black,
      ),
      body: VideoPlayerWidget(
        video: args.video,
        local: false,
      ),
    );
  }
}
