import 'package:bloc_part/logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_part/logic/cubits/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Cubit Counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocListener<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state == 4) {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const AlertDialog(
                            content: Text("Ajoyib"),
                          );
                        });
                  }
                },
                child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                  if (state is CounterLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is CounterError) {
                    return Text(state.message);
                  }
                  return Text(
                    '${state.number}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: BlocProvider.of<CounterCubit>(context).incement,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
    ;
  }
}
