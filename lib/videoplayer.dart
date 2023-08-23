
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Sampleplayer extends StatefulWidget {
  const Sampleplayer({Key? key}) : super(key: key);

  @override
  State<Sampleplayer> createState() => _SampleplayerState();
}

class _SampleplayerState extends State<Sampleplayer> {

  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController:
      VideoPlayerController.networkUrl(
        Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      ),
    );
  }
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FlickVideoPlayer(
        flickManager: flickManager,
      ),
    );
  }
}
