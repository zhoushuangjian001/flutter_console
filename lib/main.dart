import 'package:flutter/material.dart';
import 'package:fd_console/fd_console.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FMARK: Debugging control platform basic widgets.
    return ConsoleApp(
      // Whether the debugging control platform is available.
      enable: true,
      // Debug control platform log method to synchronize IDE output.
      syncIDE: true,
      // The maximum number of logs in the debugging control platform,
      // and the extra ones are operated by FIFO.
      maxCount: 1000,
      // ... more parameter.
      child: MaterialApp(
        title: 'Fd_Console',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'FDC Demo'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        // FMARK: flog more method.
        // flogRed(...)
        // flogYellow(...)
        // flogGreen(...)
        flog('$_counter is an even number!');
      } else {
        // FMARK: fprint more method.
        // fprintRed(...)
        // fprintYellow(...)
        // fprintGreen(...)
        fprint('$_counter is an odd number!');
      }
    });
  }

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
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
