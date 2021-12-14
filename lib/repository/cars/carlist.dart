import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cars.dart';

/// Method [fetchCars] for parse and decode data from url.
Future<List<dynamic>> fetchCars() async {
  var result = await http.get(Uri.parse(
      'http://filehost.feelsoftware.com/jsonplaceholder/cars-api.php'));
  return json.decode(result.body)['cars'];
}

/// Method [carCreate] for return copy of Cars in list.
Future<List<Cars>> carCreate() async {
  List<dynamic> json = await fetchCars();
  List<Cars> car = [];
  json.forEach((v) {
    car.add(Cars(number: v['number'], date: v['date'], state: v['state']));
  });
  return car;
}