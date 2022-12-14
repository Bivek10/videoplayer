import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';

class VideoDataModel extends VideoEntities {
  VideoDataModel({
    required String videoname,
    required String videoext,
    required int repeatValue,
    required int videoDuration,
    String? videoPlayTime,
  }) : super(
          repeatValue: repeatValue,
          videoname: videoname,
          videoext: videoext,
          videoplaytime: videoPlayTime,
          videoduration: videoDuration,
        );

  factory VideoDataModel.fromJson({required Map<String, dynamic> videojson}) {
    return VideoDataModel(
        videoname: videojson["name"],
        videoext: videojson["ext"],
        repeatValue: videojson["repeat"],
        videoPlayTime: videojson["time"],
        videoDuration: videojson["duration"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': videoname,
      'ext': videoext,
      'repeat': videoplaytime,
      'time': videoplaytime,
      "duration": videoduration,
    };
  }
}

class VideoModelList extends VideoEnitiesList {
  VideoModelList(List<VideoDataModel> videoList) : super(videoList);

  factory VideoModelList.fromJson({
    required List<Map<String, dynamic>> videoList,
  }) {
    List<VideoDataModel> videoData = [];

    for (var element in videoList) {
      VideoDataModel videoDataModel = VideoDataModel(
          videoname: element["name"],
          videoext: element["ext"],
          repeatValue: element["repeat"],
          videoPlayTime: element["time"],
          videoDuration: element["duration"]);
      videoData.add(videoDataModel);
    }
    return VideoModelList(videoData);
  }
}
