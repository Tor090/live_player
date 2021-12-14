import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/home/bloc/home_state.dart';
import 'package:live_player/home/view/home_view.dart';

/// Class [HomePage] for create a view implements Cubit.
class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: CarCubit(), child: HomeView());
  }
}
