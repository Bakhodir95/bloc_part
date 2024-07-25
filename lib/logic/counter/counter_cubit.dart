import 'package:bloc/bloc.dart';
import 'package:bloc_part/logic/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0));

  void incement() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    // emit(CounterCounted(state.number + 1));
    emit(CounterError("Internet error", state.number));
  }

  void decrement() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterCounted(state.number - 1));
  }
}
