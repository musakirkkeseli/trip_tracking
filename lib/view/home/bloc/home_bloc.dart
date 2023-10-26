import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<DateSet>(
      _gotoHomeView,
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
}
