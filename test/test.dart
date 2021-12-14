import 'package:flutter_test/flutter_test.dart';
import 'package:live_player/repository/cars/carlist.dart';
import 'package:live_player/repository/cars/cars.dart';

void main(){
  test('Car fect test', () async{
    List<Cars> car = [];
    car = await carCreate();
    expect(car.length, 10);
  });
}