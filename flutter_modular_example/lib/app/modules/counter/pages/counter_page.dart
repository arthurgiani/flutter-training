import 'package:flutter/material.dart';
import 'package:flutter_modular_example/app/modules/counter/value_notifiers/counter_notifier.dart';

class CounterPage extends StatefulWidget {
  final CounterNotifier counterNotifier;
  const CounterPage({Key? key, required this.counterNotifier})
      : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
              valueListenable: widget.counterNotifier,
              builder: (_, value, ___) {
                return Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.counterNotifier.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPageParams {
  final String text1;
  final String text2;

  SecondPageParams(this.text1, this.text2);
}
