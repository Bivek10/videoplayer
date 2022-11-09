part of 'videoloader_bloc.dart';

abstract class VideoloaderState extends Equatable {
  const VideoloaderState();

  @override
  List<Object> get props => [];
}

class VideoloaderInitial extends VideoloaderState {}

class VideoLoadedState extends VideoloaderState {
  final VideoEntities filedetail;

  const VideoLoadedState({required this.filedetail});

  @override
  List<Object> get props => [filedetail];
}

class VideoErrorState extends VideoloaderState {
  final String error;

  const VideoErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
