part of 'home_bloc.dart';

enum PostStatus {
  initial,
  success,
  failure,
  singlePostInitial,
  singlePostSuccess,
  singlePostFailure
}

class HomeState {
  const HomeState({
    this.status = PostStatus.initial,
    this.success = true,
    this.sonFlag = false,
    this.flag = 0,
    this.date,
  });

  final PostStatus status;
  final bool success;
  final bool sonFlag;
  final int flag;
  final DateTime? date;

  HomeState copyWith({
    PostStatus? status,
    bool? success,
    bool? sonFlag,
    int? flag,
    DateTime? date,
  }) {
    return HomeState(
      status: status ?? this.status,
      success: success ?? this.success,
      sonFlag: sonFlag ?? this.sonFlag,
      flag: flag ?? this.flag,
      date: date ?? this.date,
    );
  }
}
