import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayPauseButtonWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  const PlayPauseButtonWidget(
      {Key? key, required this.controller, this.isPlaying = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (BuildContext context, VideoPlayerValue value, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 6),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                if (value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              },
              icon: Icon(
                value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
