import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/widgets/cubit/second_player_bloc.dart';

import 'second_video_player.dart';

class SecondVideoPlayerView extends StatelessWidget {
  const SecondVideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SecondAuthCubit(),
      child: SecondVideoPlayerLayout('Back Camera'));
  }
}