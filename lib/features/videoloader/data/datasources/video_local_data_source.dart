import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:videorender/features/videoloader/data/models/video_data_model.dart';

abstract class VideoLocalSource {
  Future<VideoModelList> getVideoData();
}

class VideoLocalSourceImpl implements VideoLocalSource {
  @override
  Future<VideoModelList> getVideoData() async {
    Future<String> stringdata =
        rootBundle.loadString("assets/video_fake_data.json");
    // print(stringdata);
    // conversion string data into json data.
    List<Map<String, dynamic>> videodatas =
        (jsonDecode(await stringdata) as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();
    //print(videodatas);
    //delaying process.
    await Future.delayed(const Duration(seconds: 2));

    return VideoModelList.fromJson(videoList: videodatas);
  }
}
