import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/widgets/cubit/first_player_bloc.dart';

import 'header_player.dart';

/// Class [FirstVideoPlayer] that realize a first player. 
class FirstVideoPlayer extends StatelessWidget {
  FirstVideoPlayer(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderPlayer(label),
        Container(
            color: Colors.blue[200],
            child: BlocBuilder<FirstAuthCubit, VideoPlayerController>(
                builder: (context, state) {
              context.read<FirstAuthCubit>().createVideo();
              return InkWell(
                  onTap: () {
                    if (state.value.isPlaying) {
                      context.read<FirstAuthCubit>().pause(state);
                    } else {
                      context.read<FirstAuthCubit>().play(state);
                    }
                  },
                  child: AspectRatio(
                      aspectRatio: 16 / 9, child: VideoPlayer(state)));
            })),
      ],
    );
  }
}

  
