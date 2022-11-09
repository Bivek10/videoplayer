class VideoEntities {
  final String videoname;
  final String videoext;
  final int repeatValue;
  final int videoduration;
  final String? videoplaytime; // nullable props.

  VideoEntities({
    required this.videoname,
    required this.videoext,
    required this.repeatValue,
    required this.videoduration,
    this.videoplaytime,
  });
}

class VideoEnitiesList {
  final List<VideoEntities> videoDataList;

  VideoEnitiesList(this.videoDataList);
}
