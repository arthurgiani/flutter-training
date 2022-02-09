import 'package:di_and_state_management/notifiers/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ChangeNotifierCounterPage extends StatefulWidget {
  const ChangeNotifierCounterPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierCounterPageState createState() =>
      _ChangeNotifierCounterPageState();
}

class _ChangeNotifierCounterPageState extends State<ChangeNotifierCounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterController = context.watch<CounterNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counterController.counter.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                counterController.increment();
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
