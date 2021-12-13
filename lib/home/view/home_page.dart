import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/home/bloc/cars_bloc.dart';
import 'package:live_player/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: CarsBloc(), child: HomeView());

    //child: const HomeView(),
  }
}
