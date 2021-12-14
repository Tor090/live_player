import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/authentication/bloc/authentication_bloc.dart';
import 'package:live_player/authentication/bloc/authentication_event.dart';
import 'package:live_player/home/bloc/home_state.dart';
import 'package:live_player/repository/cars/cars.dart';
import 'package:live_player/widgets/video_player_page.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CarCubit cubit = CarCubit();  // Create cubit copy.

/// Method for init states when page load.
  @override
  void initState() {
    cubit.backCar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          leadingWidth: 80,
          leading: const Center(
              child: Text('No Filter',
                  style: TextStyle(fontSize: 16, color: Colors.black))),
          actions: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              color: Colors.blue,
              child: Builder(
                builder: (context) {
                  final userId = context.select(
                    (AuthenticationBloc bloc) => bloc.state.user.id,
                  );
                  return Text('Hello, $userId');
                },
              ),
            ),
            ElevatedButton(
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                }),
          ],
        ),
        body: Row(
          children: [
            Flexible(flex: 1, child: _buildListCars()),
            const VerticalDivider(
              width: 5.0,
              color: Colors.black,
            ),
            Flexible(flex: 3, child: _rowBuild())
          ],
        ));
  }

  Widget _rowBuild() {
    return const VideoPlayerPage();
  }

  Widget _buildListCars() {
    Color? _color;
    return BlocBuilder<CarCubit, List<Cars>>(
      bloc: cubit,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            if (state[index].state == 'avaible') {
              _color = Colors.greenAccent;
            } else if (state[index].state == 'hidden') {
              _color = Colors.blue;
            } else {
              _color = Colors.orange[200];
            }
            return Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${state[index].number}',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  subtitle: Text(
                    state[index].date,
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  tileColor: _color,
                  onTap: () => Dialogs().simpleDialog(context, state[index]),
                )
              ],
            ));
          },
        );
      },
    );
  }
}


/// Class [Dialogs] that realize dialog when we tap on [ListTile].
class Dialogs {
  Future simpleDialog(BuildContext context, Cars state) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 40),
            contentTextStyle: const TextStyle(fontSize: 25),
            title: Text('${state.number}'),
            content: SizedBox(
              height: 115,
              width: 656,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status: ${state.state}',
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text(state.date,
                      style: const TextStyle(
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
