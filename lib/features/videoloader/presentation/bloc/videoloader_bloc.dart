import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:videorender/features/videoloader/data/models/video_data_model.dart';
import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';
import 'package:videorender/features/videoloader/domain/repositories/video_repo.dart';
import 'package:videorender/features/videoloader/domain/usecases/video_play_logic.dart';

import '../../../../injection.dart';
import 'dart:developer';

part 'videoloader_event.dart';
part 'videoloader_state.dart';

class VideoloaderBloc extends Bloc<VideoloaderEvent, VideoloaderState> {
  // final GetVideoFromDirectories getVideoFromDirectories;
  //
  final videostreamController = StreamController<VideoEntities>();
  Stream<VideoEntities> get videos => videostreamController.stream;

  VideoloaderBloc() : super(VideoloaderInitial()) {
    on<LoadVideoDataEvent>(onLoadVideoDataEvent);
    on<PlayVideoEvent>(_onPlayVideoEvent);
  }

  Future<void> onLoadVideoDataEvent(
      LoadVideoDataEvent event, Emitter<VideoloaderState> emit) async {
    emit(VideoloaderInitial());

    VideoPlayRepo videoPlayRepo = sl.get();

    GetVideoFromDirectories getVideoFromDirectories =
        GetVideoFromDirectories(videoPlayRepo: videoPlayRepo);

    VideoEnitiesList videoEnitiesList =
        await getVideoFromDirectories.returnVideostoUI();
    //print(videoEnitiesList.videoDataList);

    if (videoEnitiesList.videoDataList.isNotEmpty) {
      try {
        if (videoEnitiesList.videoDataList.isNotEmpty) {
          final videoList = videoEnitiesList.videoDataList;
          List<Map<String, dynamic>> listmap = [];
          int totalrepeat = 0;

          for (var ele in videoList) {
            if (ele.videoplaytime!.isEmpty) {
              listmap.add({
                "name": ele.videoname,
                "datetime": ele.videoplaytime,
                "duration": ele.videoduration,
                "ext": ele.videoext,
                "repeat": ele.repeatValue,
                "isRunning": false
              });
              totalrepeat += ele.repeatValue;
            }
          }
          int totallooping = totalrepeat ~/ 5;

          log(totallooping.toString());

          var highrepeatvideo = listmap.reduce((value, element) =>
              value["repeat"] > element["repeat"] ? value : element);

          log("highest repeated video  " + highrepeatvideo.toString());

          int highrepeatevideoindex = listmap.indexOf(highrepeatvideo);

          highrepeatvideo["isRunning"] = true;
          listmap.removeAt(highrepeatevideoindex);
          listmap.insert(highrepeatevideoindex, highrepeatvideo);
          log("initial lismap" + listmap.toString());
          for (var j = 0; j < totallooping; j++) {
            for (int i = 0; i < listmap.length; i++) {
              if (listmap[i]["repeat"] != 0 &&
                  listmap[i]["isRunning"] == true) {
                listmap[i]["repeat"] = listmap[i]["repeat"] - 5;
                log("on round: " + listmap.toString());
                event.videoloaderBloc
                    .add(PlayVideoEvent(videoList[i], listmap[i]["repeat"]));
                await Future.delayed(
                    Duration(seconds: videoList[i].videoduration));

                if (listmap[i]["repeat"] == 0 &&
                    listmap[i]["isRunning"] == true) {
                  listmap[i]["isRunning"] = false;

                  log(listmap.toString());
                  var highrepeatvideos = listmap.reduce((value, element) =>
                      value["repeat"] > element["repeat"] ? value : element);

                  highrepeatvideos["isRunning"] = true;
                  highrepeatvideos["repeat"] = highrepeatvideos["repeat"] - 5;
                  highrepeatevideoindex = listmap.indexOf(highrepeatvideos);
                  event.videoloaderBloc.add(PlayVideoEvent(
                      videoList[highrepeatevideoindex],
                      highrepeatvideos["repeat"]));
                  await Future.delayed(Duration(
                      seconds: videoList[highrepeatevideoindex].videoduration));

                  listmap.removeAt(highrepeatevideoindex);

                  listmap.insert(highrepeatevideoindex, highrepeatvideos);
                }
              }
            }
          }
        }
      } catch (e, s) {
        throw s;
      }
    }
  }

  Future<void> _onPlayVideoEvent(
      PlayVideoEvent event, Emitter<VideoloaderState> emit) async {
    emit(VideoloaderInitial());
    emit(
      VideoDataLoadedState(
          filedetail: event.videoEntities, repeatvalue: event.repeat),
    );
  }
}

class VideoDataStream {
  final VideoEnitiesList videoEnitiesList;
  final VideoloaderBloc videoloaderBloc;

  VideoDataStream(this.videoEnitiesList, this.videoloaderBloc);
}

class VidoeDataStream {
  final VideoEntities videoEntitieswithdate;
  final VideoloaderBloc videoloaderBloc;

  VidoeDataStream(
      {required this.videoEntitieswithdate, required this.videoloaderBloc});

  Stream<int> videosstream() {
    return Stream.periodic(Duration(seconds: 1), (time) => time).timeout(
      const Duration(seconds: 1),
      onTimeout: (sink) {
        videoloaderBloc.add(const VideoloaderEvent());I
      },
    );
  }
}
