import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterEvent>((event, emit) async {
      emit(
        CounterLoading(state.number),
      );
      if (event is CounterIncrementEvent) {
        await Future.delayed(const Duration(seconds: 2));
        emit(
          CounterCounted(state.number + 1),
        );
      } else if (event is CounterDecrementEvent) {
        await Future.delayed(const Duration(seconds: 2));
        emit(
          CounterCounted(state.number - 1),
        );
      }
    });
  }
}
