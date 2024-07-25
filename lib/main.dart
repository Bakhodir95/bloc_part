import './logic/counter/counter_cubit.dart';
import './logic/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
  }
}
