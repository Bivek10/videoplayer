part of 'videoloader_bloc.dart';

abstract class VideoloaderEvent extends Equatable {
  const VideoloaderEvent();

  @override
  List<Object> get props => [];
}

class LoadVideoDataEvent extends VideoloaderEvent {
  final VideoloaderBloc videoloaderBloc;

  const LoadVideoDataEvent(this.videoloaderBloc);
}

class PlayVideoEvent extends VideoloaderEvent {
  final VideoEntities videoEntities;
  final int repeat;

  const PlayVideoEvent(this.videoEntities, this.repeat);
}

class PlayOneTimerEvent extends VideoloaderEvent {
  final VideoEntities videoEntities;
  final int repeat;

  PlayOneTimerEvent(this.videoEntities, this.repeat);
}
