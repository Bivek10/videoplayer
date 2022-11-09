import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:video_player/video_player.dart';
import 'package:videorender/features/videoloader/presentation/bloc/videoloader_bloc.dart';

import '../../../../core/functions/video_initializer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController videoPlayerController;
  late VideoloaderBloc videoloaderBloc;
  int totalvideoload = 0;
  @override
  void initState() {
    super.initState();
    tiggerLoadVideoEvent();
  }

  tiggerLoadVideoEvent() {
    videoloaderBloc = VideoloaderBloc();
    videoloaderBloc.add(LoadVideoDataEvent(videoloaderBloc));
  }

  @override
  Widget build(BuildContext context) {
    //print("Widget rebulding");
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          "Video Player".toUpperCase(),
          style: const TextStyle(
            color: Color.fromARGB(255, 230, 227, 227),
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: BlocConsumer<VideoloaderBloc, VideoloaderState>(
        bloc: videoloaderBloc,
        builder: ((context, state) {
          //print(state);
          if (state is VideoDataLoadedState) {
            totalvideoload += 1;
            return videoPlayerController.value.isInitialized
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

          if (state is VideoErrorState) {
            return const Center(
              child: Text("Error...."),
            );
          }
          return const Center(
            child: SizedBox(
              width: 50,
              child: LinearProgressIndicator(
                backgroundColor: Color.fromARGB(255, 245, 240, 240),
                valueColor: AlwaysStoppedAnimation(Colors.green),
                minHeight: 5,
              ),
            ),
          );
        }),
        listener: (context, state) {
          if (state is VideoDataLoadedState) {
            runVideo(
                videoname:
                    "assets/${state.filedetail.videoname}${state.filedetail.videoext}");
          }
        },
      ),
    );
  }

  // dipose the controller when state closed.
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  void runVideo({required videoname}) {
    VideoInitializer.setVideo(videoname);
    videoPlayerController = VideoInitializer.videoController
      ..initialize().then((value) {
        setState(() {
          value;
        });
      });
    videoPlayerController.play();

    //videoPlayerController.pause();
    //videoPlayerController.setLooping(true);
  }
}
