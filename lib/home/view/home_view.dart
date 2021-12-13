import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/authentication/bloc/authentication_bloc.dart';
import 'package:live_player/authentication/bloc/authentication_event.dart';
import 'package:live_player/home/bloc/cars_bloc.dart';
import 'package:live_player/home/bloc/home_event.dart';
import 'package:live_player/home/bloc/home_state.dart';
import 'package:live_player/repository/cars/list_cars.dart';
import 'package:live_player/widgets/video_player_page.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    loadCars();
    super.initState();
  }

  loadCars() async {
    context.read<CarsBloc>().add(CarsEvents.fetchCars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
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
          Flexible(flex: 1,child: _buildListCars()),
          VerticalDivider(width: 5.0,color: Colors.black,),
          Flexible(flex: 2,child: _rowBuild())
        ],
      )
    );
  }

  Widget _rowBuild() {
    return VideoPlayerPage();
  }

  Widget _buildListCars() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocBuilder<CarsBloc, CarsState>(
        builder: (context, state) {
          if (state is CovidInitial) {
            return _buildLoading();
          } else if (state is CarsLoading) {
            return _buildLoading();
          } else if (state is CarsLoaded) {
            return _buildCard(context, state.covidModel);
          } else if (state is CarsError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, CarsList model) {
    return ListView.builder(
      itemCount: model.cars.length,
      itemBuilder: (context, index) {
        var color;
        switch (model.cars[index].state) {
          case 'available':
            color = Colors.green;
            break;
          case 'hidden':
            color = Colors.blue[900];
            break;
          case 'disabled':
            color = Colors.orange[100];
            break;
        }
        return Container(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('${model.cars[index].number}'),
            subtitle: Text(model.cars[index].date),
            tileColor: color,
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
