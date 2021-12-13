import 'package:flutter/material.dart';

import 'first_video_player_view.dart';
import 'second_video_player_view.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Flexible(
                  flex: 1,
                  child: FirstVideoPlayerView()),
              SizedBox(
                width: 24,
              ),
              Flexible(
                  flex: 1,
                  child: SecondVideoPlayerView())
            ],
    );
  }
}
