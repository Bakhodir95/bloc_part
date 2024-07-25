// import 'dart:async';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key, required this.title});

//   final String title;

//   int _counter = 0;

//   void _incrementCounter() {
//     _streamController.sink.add(_counter++);
//     // setState(() {
//     //   _counter++;
//     // });
//   }

//   final StreamController _streamController = StreamController<int>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             StreamBuilder(
//                 initialData: 0,
//                 stream: _streamController.stream,
//                 builder: (context, snapshoot) {
//                   return Text(
//                     '${snapshoot.data}',
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   );
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
