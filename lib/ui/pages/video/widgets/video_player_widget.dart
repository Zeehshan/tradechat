import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class VideoPlayerWidget extends StatefulWidget {
  final bool local, playOption;
  final String video;
  final Widget? widget;
  final VideoPlayerController? playerController;
  final double border;
  final double? width;
  final bool fullScreen;
  final Function(double ratio, VideoPlayerController playerController)? ratio;
  const VideoPlayerWidget(
      {Key? key,
      this.local = false,
      required this.video,
      this.widget,
      this.ratio,
      this.playOption = true,
      this.playerController,
      this.border = 0,
      this.width,
      this.fullScreen = false})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool startPlay = false;
  @override
  void initState() {
    super.initState();
    if (widget.playerController != null) {
      _controller = widget.playerController!;
    } else if (widget.local) {
      _controller = VideoPlayerController.file(
        File(widget.video),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      )
        ..addListener(() {
          setState(() {});
        })
        ..setLooping(false)
        ..initialize().then((_) {
          if (widget.ratio != null) {
            widget.ratio!(_controller.value.aspectRatio, _controller);
          }
        });
    } else {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.video),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      )
        ..addListener(() {
          setState(() {});
        })
        ..setLooping(false)
        ..initialize().then((_) {
          if (widget.ratio != null) {
            widget.ratio!(_controller.value.aspectRatio, _controller);
          }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const SizedBox(
        height: 200,
        // child: LoadingWidget(),
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.border),
            child: Container(
              width: widget.width,
              color: Theme.of(context).backgroundColor,
              child: Center(
                child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)),
              ),
            ),
          ),
        ),
        if (startPlay & widget.playOption)
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlayPauseButtonWidget(
                    controller: _controller,
                  ),
                  VideoProgressWidget(
                    controller: _controller,
                  ),
                  // Container(
                  //   width: 26,
                  //   height: 26,
                  //   margin: const EdgeInsets.only(right: 11, left: 9, top: 6),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(.6),
                  //       borderRadius: BorderRadius.circular(100)),
                  //   child: IconButton(
                  //     icon: SvgPicture.asset(AssetsPath.fullScreen),
                  //     onPressed: () => Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => LandscapeVideoPlayerWidget(
                  //                   controller: _controller,
                  //                   fullScreen: widget.fullScreen,
                  //                 ))),
                  //   ),
                  // ),
                ],
              )),
        if (!startPlay && widget.playOption)
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.play_circle_filled_rounded),
                onPressed: () {
                  setState(() {
                    startPlay = true;
                  });
                  _controller.play();
                },
              ),
            ),
          ),
        if (!startPlay)
          Container(
            child: widget.widget,
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
