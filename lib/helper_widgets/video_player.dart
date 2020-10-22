import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studymate_app/screens/layout.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses_desktop.dart';
import 'package:studymate_app/utils/constants.dart';
import 'package:video_player/video_player.dart';

import 'custom_dialog.dart';

class VideoDisplay extends StatefulWidget {
  final double width;
  final bool isFullScreen;
  final double height;
  final Duration seek;
  final VideoPlayerController thatController;
  VideoDisplay({
    Key key,
    @required this.width,
    @required this.height,
    this.seek,
    this.thatController,
    this.isFullScreen,
  }) : super(key: key);

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  VideoPlayerController _controller;
  VoidCallback listener;
  Future<void> _initializeVideoPlayerFuture;
  IconData playPauseIcon = Icons.play_arrow;
  bool isMuted = false;
  bool isFullScreen;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    isFullScreen = widget.isFullScreen;
    print('full screen is ${widget.isFullScreen}');
    listener = () {
      setState(() {});
      if (widget.thatController != null && _controller != null) {
        widget.thatController.seekTo(_controller.value.position);
      }
    };
    _controller = VideoPlayerController.asset('assets/videos/test.mp4')
      ..addListener(listener)
      ..setVolume(0.5);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (widget.seek != null) {
        _controller.seekTo(widget.seek);
        _controller.play();
      } else {
        _controller.pause();
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _controller.setVolume(0.0);
    _controller.removeListener(listener);
    super.deactivate();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  void onPlayPauseTap() {
    print(_controller.value.isPlaying);
    // If the video is playing, pause it.
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      // If the video is paused, play it.
      if (_controller.value.position == _controller.value.duration) {
        _controller.initialize();
        _controller.play();
      }
      _controller.play();
    }
  }

  _showFullScreen() {
    _controller.pause();
    showDialog(
      context: context,
      builder: (_) => CustomDialog(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VideoDisplay(
          key: GlobalKey(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9 / 16,
          seek: _controller?.value?.position ?? null,
          thatController: _controller,
          isFullScreen: true,
        ),
      )),
    ).then((_) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.

          return AspectRatio(
            aspectRatio: widget.width / widget.height,
            // Use the VideoPlayer widget to display the video.
            child: RoundedContainer(
              borderRadius: kAppBorderRadius,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                      borderRadius: kAppBorderRadius,
                      child: VideoPlayer(_controller)),
                  Positioned(
                    bottom: 0,
                    width: widget.width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Progress(
                                parentWidth: double.infinity,
                                color: Colors.red,
                                height: 2,
                                width: _controller.value.position.inSeconds /
                                    _controller.value.duration.inSeconds),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Controls(
                            isPlaying: _controller.value.isPlaying,
                            onPlayTap: onPlayPauseTap,
                            currentVolume: _controller.value.volume,
                            isMuted: isMuted,
                            onMute: () {
                              _controller.setVolume(isMuted ? 0.5 : 0.0);
                              setState(() {
                                isMuted = !isMuted;
                              });
                            },
                            onSetVolume: (volume) {
                              _controller.setVolume(volume);
                              setState(() {
                                isMuted = false;
                              });
                            },
                            isFullScreen: isFullScreen,
                            onFullScreen: _showFullScreen,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ));
        }
      },
    );
  }
}

class Controls extends StatelessWidget {
  final bool isPlaying;
  final Function onPlayTap;
  final Function onMute;
  final Function onSetVolume;
  final Function onFullScreen;
  final bool isMuted;
  final bool isFullScreen;
  final double currentVolume;
  const Controls(
      {this.isPlaying,
      this.onPlayTap,
      this.isMuted,
      this.currentVolume,
      this.onMute,
      this.onSetVolume,
      this.onFullScreen,
      this.isFullScreen});
  IconData _getVolumeIcon() {
    if (isMuted) {
      return Icons.volume_off;
    } else {
      if (currentVolume == 0.0) {
        return Icons.volume_mute;
      } else if (currentVolume < 0.5) {
        return Icons.volume_down;
      } else {
        return Icons.volume_up;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('fullscreen iniside $isFullScreen');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ControlMenu(
                onTap: () {},
                icon: Icons.skip_previous,
              ),
              SizedBox(
                width: 5,
              ),
              ControlMenu(
                onTap: onPlayTap,
                icon: isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              SizedBox(
                width: 5,
              ),
              ControlMenu(
                onTap: () {},
                icon: Icons.skip_next,
              ),
              SizedBox(
                width: 5,
              ),
              ControlMenu(
                onTap: onMute,
                icon: _getVolumeIcon(),
              ),
              VolumeControl(
                onVolumeChange: onSetVolume,
                volume: currentVolume,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ControlMenu(
                onTap: isFullScreen
                    ? () => Navigator.of(context).pop()
                    : onFullScreen,
                icon: isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ControlMenu extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const ControlMenu({this.onTap, this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.white,
        size: 12,
      ),
    );
  }
}

class VolumeControl extends StatelessWidget {
  final Function onVolumeChange;
  final double volume;

  const VolumeControl({this.onVolumeChange, this.volume});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      margin: EdgeInsets.zero,
      width: 70,
      height: 3,
      child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white,
            thumbColor: Colors.white,
            overlayColor: Colors.transparent,
            trackHeight:
                1.5, //<------Change this number here to change the height----
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: volume,
            min: 0,
            max: 1,
            onChanged: onVolumeChange,
          )),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
