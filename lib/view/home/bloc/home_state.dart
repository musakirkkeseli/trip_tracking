part of 'home_bloc.dart';

enum PostStatus {
  initial,
  success,
  failure,
}

class HomeState {
  const HomeState(
      {this.status = PostStatus.success,
      this.success = true,
      this.sonFlag = false,
      this.flag = 0,
      this.date,
      this.responseModel});

  final PostStatus status;
  final bool success;
  final bool sonFlag;
  final int flag;
  final DateTime? date;
  final TripResponseModel? responseModel;

  HomeState copyWith({
    PostStatus? status,
    bool? success,
    bool? sonFlag,
    int? flag,
    DateTime? date,
    TripResponseModel? responseModel,
  }) {
    return HomeState(
      status: status ?? this.status,
      success: success ?? this.success,
      sonFlag: sonFlag ?? this.sonFlag,
      flag: flag ?? this.flag,
      date: date ?? this.date,
      responseModel: responseModel ?? this.responseModel,
    );
  }
}
