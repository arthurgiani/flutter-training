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
    ///[context.watch<T>] is the same of [Provider.of<T>(context)]
    //final counterNotifier = context.watch<CounterNotifier>;
    final counterNotifier = Provider.of<CounterNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counterNotifier.counter.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                counterNotifier.increment();
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
