import 'package:videorender/features/videoloader/data/datasources/video_local_data_source.dart';
import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';
import 'package:videorender/features/videoloader/domain/repositories/video_repo.dart';

class VideoRepoImpl implements VideoPlayRepo {
  final VideoLocalSource videoLocalSource;

  VideoRepoImpl({required this.videoLocalSource});
  @override
  Future<VideoEnitiesList> getVideos() {
    return videoLocalSource.getVideoData();
  }
}
