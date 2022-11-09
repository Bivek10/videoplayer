part of 'videoloader_bloc.dart';

abstract class VideoloaderState extends Equatable {
  const VideoloaderState();

  @override
  List<Object> get props => [];
}

class VideoloaderInitial extends VideoloaderState {}

class VideoDataLoadedState extends VideoloaderState {
  final VideoEntities filedetail;
  final int repeatvalue;
  const VideoDataLoadedState(
      {required this.filedetail, required this.repeatvalue});
  @override
  List<Object> get props => [filedetail, repeatvalue];
}

class VideoErrorState extends VideoloaderState {
  final String error;

  const VideoErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class OneTimerVideoLoaded extends VideoloaderState {
  final VideoEntities fileDetail;
  final String runTime;

  OneTimerVideoLoaded(this.fileDetail, this.runTime);
}
