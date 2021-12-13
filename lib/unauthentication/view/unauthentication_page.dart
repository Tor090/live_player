import 'package:flutter/material.dart';
import 'package:live_player/widgets/video_player_page.dart';

class UnAuthPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UnAuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          elevation: 0,
        ),
        body: const Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 26),
              child: VideoPlayerPage()),
        ));
  }
}
