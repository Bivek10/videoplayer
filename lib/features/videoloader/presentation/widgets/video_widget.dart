import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String videoname;
  final String videoext;
  final int repeatValue;
  final String? datetime;
  final bool oneTimevideo;
  final int totalrepeat;
  const VideoWidget({
    Key? key,
    required this.videoPlayerController,
    required this.videoname,
    required this.videoext,
    required this.repeatValue,
    required this.oneTimevideo,
    this.datetime,
    required this.totalrepeat,
  }) : super(key: key);

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
                  child: VideoPlayer(widget.videoPlayerController),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Title: ${widget.videoname}${widget.videoext}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Repeat Value: ${widget.repeatValue}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Video should paly in One round: ${widget.totalrepeat / 5} time",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total video played: ${(widget.totalrepeat - widget.repeatValue) / 5} time ",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Is one timer video: ${widget.datetime}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              widget.oneTimevideo
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "oneTimer Vidoe",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  : const SizedBox()
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
