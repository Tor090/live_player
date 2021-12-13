import 'package:equatable/equatable.dart';
import 'package:live_player/repository/cars/list_cars.dart';

abstract class CarsState extends Equatable {
  const CarsState();
}

class CovidInitial extends CarsState {
  const CovidInitial();
  @override
  List<Object> get props => [];
}

class CarsLoading extends CarsState {
  const CarsLoading();
  @override
  List<Object> get props => [];
}

class CarsLoaded extends CarsState {
  final CarsList covidModel;
  const CarsLoaded(this.covidModel);
  @override
  List<Object> get props => [covidModel];
}

class CarsError extends CarsState {
  final String message;
  const CarsError(this.message);
  @override
  List<Object> get props => [message];
}
