part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class DateSet extends HomeEvent {
  final DateTime date;
  DateSet(this.date);
}

class FetchData extends HomeEvent {
  final TripRequestModel requestModel;
  FetchData(this.requestModel);
}
