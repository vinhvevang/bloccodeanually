import 'package:bloc/bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class ChangeTabEvent extends HomeEvent {
  const ChangeTabEvent(this.index);

  final int index;
}

class HomeBloc extends Bloc<HomeEvent, int> {
  HomeBloc() : super(0) {
    on<ChangeTabEvent>((event, emit) => emit(event.index));
  }
}