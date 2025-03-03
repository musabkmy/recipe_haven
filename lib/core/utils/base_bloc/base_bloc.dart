import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<T, K> extends Bloc<BaseEvent, BaseState<T, K>> {
  BaseBloc() : super(const InitialState());

  Future<T> fetchData();
}
