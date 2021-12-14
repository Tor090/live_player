import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/repository/video/video.dart';
import 'package:video_player/video_player.dart';

/// Class [FirstAuthCubit] for realize a cubit architecture for a first videoplayer.
class FirstAuthCubit extends Cubit<VideoPlayerController> {
  FirstAuthCubit() : super(VideoPlayerController.asset('Not found'));
  VideoPlayerController controller =
      VideoPlayerController.network(Video().difUrl());

  void createVideo() {
    print('first ${controller.dataSource}');
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    emit(controller);
  }

  
  void play(VideoPlayerController controller) {
    controller.play();
    emit(controller);
  }

  void pause(VideoPlayerController controller) {
    controller.pause();
    emit(controller);
  }
}
