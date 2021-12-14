import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/repository/video/video.dart';
import 'package:video_player/video_player.dart';

/// Class [SecondAuthCubit] for realize a cubit architecture for a second videoplayer. 
class SecondAuthCubit extends Cubit<VideoPlayerController> {
  SecondAuthCubit() : super(VideoPlayerController.asset('Not found'));
  VideoPlayerController controller =
      VideoPlayerController.network(Video().difUrl());

  void createSecondVideo() {
    print('first ${controller.dataSource}');
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    emit(controller);
  }

  
  void playSecond(VideoPlayerController controller) {
    controller.play();
    emit(controller);
  }

  void pauseSecond(VideoPlayerController controller) {
    controller.pause();
    emit(controller);
  }
}
