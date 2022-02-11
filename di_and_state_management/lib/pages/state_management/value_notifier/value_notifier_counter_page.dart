import 'package:di_and_state_management/notifiers/counter_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueNotifierCounterPage extends StatefulWidget {
  const ValueNotifierCounterPage({Key? key}) : super(key: key);

  @override
  _ValueNotifierCounterPageState createState() =>
      _ValueNotifierCounterPageState();
}

class _ValueNotifierCounterPageState extends State<ValueNotifierCounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterValueNotifier = context.watch<CounterValueNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(counterValueNotifier.value.toString()),
            ElevatedButton(
              onPressed: () {
                counterValueNotifier.increment();
              },
              child: const Text(
                'Increment Counter',
              ),
            )
          ],
        ),
      ),
    );
  }
}
