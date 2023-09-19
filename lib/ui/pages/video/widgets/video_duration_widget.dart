import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDurationWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoDurationWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (BuildContext context, VideoPlayerValue value, child) {
          return Row(
            children: [
              SizedBox(
                child: Text(
                  '${RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch(value.position.toString())?.group(1)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white, fontSize: 12),
                ),
              ),
              Text(
                '/',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                child: Text(
                  '${RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch(controller.value.duration.toString())?.group(1)}',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          );
        });
  }
}
