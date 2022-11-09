import 'package:videorender/features/videoloader/domain/entities/video_entities.dart';
import 'package:videorender/features/videoloader/domain/repositories/video_repo.dart';

class GetVideoFromDirectories {
  final VideoPlayRepo videoPlayRepo;

  GetVideoFromDirectories({required this.videoPlayRepo});

  Future<VideoEnitiesList> returnVideostoUI() {
    return videoPlayRepo.getVideos();
  }
  
}
