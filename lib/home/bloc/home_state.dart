import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_player/repository/cars/carlist.dart';
import 'package:live_player/repository/cars/cars.dart';

/// Class [CarCubit] realize fetch from API whit Cubit architecture on home page.
class CarCubit extends Cubit<List<Cars>> {
  CarCubit() : super([]);

  List<Cars> car = [];

  void backCar() async{
    car = await carCreate();
    emit(car);
  }
}
