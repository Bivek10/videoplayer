import 'package:get_it/get_it.dart';
import 'package:videorender/features/videoloader/data/datasources/video_local_data_source.dart';
import 'package:videorender/features/videoloader/domain/repositories/video_repo.dart';
import 'package:videorender/features/videoloader/domain/usecases/video_play_logic.dart';
import 'package:videorender/features/videoloader/presentation/bloc/videoloader_bloc.dart';

import 'features/videoloader/data/repositories/video_repo_imp.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  // sl.registerFactory(
  //   () => VideoloaderBloc(
  //     getVideoFromDirectories: sl(),
  //   ),
  // );

  // Use cases
  sl.registerLazySingleton(() => GetVideoFromDirectories(videoPlayRepo: sl()));

  // Repository
  sl.registerLazySingleton<VideoPlayRepo>(
    () => VideoRepoImpl(
      videoLocalSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<VideoLocalSource>(
    () => VideoLocalSourceImpl(),
  );
}
