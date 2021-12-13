import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:live_player/repository/api_provider/api_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class CarsBloc extends Bloc<CarsEvents, CarsState> {
  final ApiRepository _apiRepository = ApiRepository();

  CarsBloc() : super(const CarsLoading());
  
  Stream<CarsState> mapEventToState(
    CarsEvents event,
  ) async* {
    switch (event){
      case CarsEvents.fetchCars:
      try {
        yield CarsLoading();
        final mList = await _apiRepository.fetchCovidList();
        yield CarsLoaded(mList);
      } on NetworkError {
        yield CarsError("Failed to fetch data. is your device online?");
      }
      break;
    }
      
    }
  }

  
  // Stream<void> mapEventToState(
  //   Emitter<LoaddataState> emit,
  //   HomeEvent event,
  // ) async* {
  //   if (event is LoadedEvent) {
  //     try {
  //       yield ;
  //       final mList = await _apiRepository.fetchCovidList();
  //       yield CovidLoaded(mList);
  //     } on NetworkError {
  //       yield throw Exception();
  //     }
  //   }
  // }

