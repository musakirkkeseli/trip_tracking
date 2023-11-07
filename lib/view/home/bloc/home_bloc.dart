import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:trip_tracking/features/model/trip_request_model.dart';
import 'package:trip_tracking/features/model/trip_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<DateSet>(
      _gotoHomeView,
    );
    on<FetchData>(
      _fetchData,
    );
  }

  _gotoHomeView(
    DateSet event,
    Emitter<HomeState> emit,
  ) {
    print("object");
    emit(state.copyWith(status: PostStatus.failure, date: event.date));
    return emit(state.copyWith(status: PostStatus.success, date: event.date));
  }

  _fetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    final String response =
        await rootBundle.loadString("assets/trip_response.json");
    final data = await json.decode(response);
    TripResponseModel tripResponseModel = TripResponseModel.fromJson(data);
    Logger().d(tripResponseModel.toJson());
    return emit(state.copyWith(
        status: PostStatus.success, responseModel: tripResponseModel));
  }
}
