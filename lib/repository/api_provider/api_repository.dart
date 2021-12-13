import 'package:live_player/repository/cars/list_cars.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CarsList> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}