import 'package:video_player/video_player.dart';

class VideoInitializer {
  static late VideoPlayerController _videoPlayerController;

  // video in controller.
  static void setVideo(String filename) {
    VideoPlayerController locVideoPlayerController =
        VideoPlayerController.asset(filename);
    _videoPlayerController = locVideoPlayerController;
  }

  // return controller with video initilizing.
  static VideoPlayerController get videoController => _videoPlayerController;
}
