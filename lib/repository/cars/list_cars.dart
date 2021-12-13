import 'package:live_player/repository/cars/cars.dart';

class CarsList {
  final List<Cars> cars;


  CarsList({required this.cars});

  factory CarsList.fromJson(Map<String, dynamic> parsedJson) {
    List<Cars> cars = [];
    parsedJson['cars'].forEach((v) {
      cars.add(Cars.fromJson(v));
    });

    CarsList car = CarsList(cars: cars);
    return car;
  }
}
