import 'package:dio/dio.dart';
//import 'package:http/http.dart';
import 'package:live_player/repository/cars/list_cars.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'http://filehost.feelsoftware.com/jsonplaceholder/cars-api.php';

  Future<CarsList> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CarsList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception();
    }
  }
}
