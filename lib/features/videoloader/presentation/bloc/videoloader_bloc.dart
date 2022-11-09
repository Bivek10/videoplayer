import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';
import 'package:videorender/features/videoloader/domain/usecases/video_play_logic.dart';

import '../../../../injection.dart';

part 'videoloader_event.dart';
part 'videoloader_state.dart';

class VideoloaderBloc extends Bloc<VideoloaderEvent, VideoloaderState> {
  // final GetVideoFromDirectories getVideoFromDirectories;
  //
  VideoloaderBloc() : super(VideoloaderInitial()) {
    on<GetandLoadVideoEvent>(onGetVideoEvent);
  }

  Future<void> onGetVideoEvent(
      VideoloaderEvent event, Emitter<VideoloaderState> emit) async {
    emit(VideoloaderInitial());

    GetVideoFromDirectories getVideoFromDirectories = sl.get();

    VideoEnitiesList videolist =
        await getVideoFromDirectories.returnVideostoUI();

    if (videolist.videoDataList.isNotEmpty) {
      emit(VideoLoadedState(filedetail: videolist.videoDataList[0]));
    } else {
      emit(
        const VideoErrorState(error: "Failed to get video data"),
      );
    }
  }
}
