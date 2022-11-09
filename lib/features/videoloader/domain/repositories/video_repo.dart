import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';

abstract class VideoPlayRepo {
  Future<VideoEnitiesList> getVideos();
}
