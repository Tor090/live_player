import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/widgets/cubit/second_player_bloc.dart';
import 'package:video_player/video_player.dart';

import 'header_player.dart';

/// Class [SecondVideoPlayerLayout] for realize a second player. 
class SecondVideoPlayerLayout extends StatelessWidget {
  SecondVideoPlayerLayout(this.label);

  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderPlayer(label),
        Container(
            // height: 339,
            // width: 603,
            color: Colors.blue[200],
            child: BlocBuilder<SecondAuthCubit, VideoPlayerController>(
                builder: (context, state) {
              context.read<SecondAuthCubit>().createSecondVideo();
              print('state ${state.value}');
              return InkWell(
                  onTap: () {
                    if (state.value.isPlaying) {
                      context.read<SecondAuthCubit>().pauseSecond(state);
                    } else {
                      context.read<SecondAuthCubit>().playSecond(state);
                    }
                  },
                  child: AspectRatio(
                      aspectRatio: 16 / 9, child: VideoPlayer(state)));
            })),
      ],
    );
  }
}
