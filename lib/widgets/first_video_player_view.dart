import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/unauthentication/cubit/first_player_bloc.dart';

import 'first_video_player.dart';

class FirstVideoPlayerView extends StatelessWidget {
  const FirstVideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FirstAuthCubit(),
      child: FirstVideoPlayer('Front Camera'));
  }
}