import 'package:bloc_part/logic/blocs/bloc/counter_bloc.dart';
import 'package:bloc_part/presentation/screens/bloc_counter_screen.dart';
import 'package:bloc_part/presentation/screens/cubit_counter_screen.dart';

import 'logic/cubits/counter/counter_cubit.dart';
import 'logic/cubits/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => CounterCubit()),
        BlocProvider(create: (ctx) => CounterBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BlocCounterScreen(),
      ),
    );
  }
}
