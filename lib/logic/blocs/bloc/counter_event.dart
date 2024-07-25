part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

// class CounterIncrementEvent extends CounterEvent {}

// class CounterIncrementEvent extends CounterEvent {}
