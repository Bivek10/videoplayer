part of 'videoloader_bloc.dart';

abstract class VideoloaderEvent extends Equatable {
  const VideoloaderEvent();

  @override
  List<Object> get props => [];
}

class GetandLoadVideoEvent extends VideoloaderEvent {}
