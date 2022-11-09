import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String videoname;
  final String videoext;
  final int repeatvalue;
  final int duration;
  const VideoWidget(
      {Key? key,
      required this.videoPlayerController,
      required this.videoname,
      required this.videoext,
      required this.repeatvalue,
      required this.duration})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.videoPlayerController.value.isInitialized
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 250,
                  child: VideoPlayer(videoPlayerController),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Title: ${state.filedetail.videoname}${state.filedetail.videoext}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Repeat Value: ${state.repeatvalue}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Video should paly in One round: ${state.filedetail.repeatValue / 5} time",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total video played: ${(state.filedetail.repeatValue - state.repeatvalue) / 5} time ",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Is one timer video:${state.filedetail.videoplaytime!.isEmpty ? " false" : state.filedetail.videoplaytime}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        : const Center(
            child: SizedBox(
              width: 50,
              child: LinearProgressIndicator(
                backgroundColor: Color.fromARGB(255, 245, 240, 240),
                valueColor: AlwaysStoppedAnimation(Colors.green),
                minHeight: 5,
              ),
            ),
          );
  }
}
