import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class VideoProgressWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoProgressWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                VideoDurationWidget(
                  controller: controller,
                ),
              ],
            ),
            ClipRRect(
              child: VideoProgressIndicator(
                controller,
                colors: const VideoProgressColors(
                    playedColor: Color(0xff3BE0DE),
                    bufferedColor: Colors.white,
                    backgroundColor: Colors.white70),
                allowScrubbing: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
