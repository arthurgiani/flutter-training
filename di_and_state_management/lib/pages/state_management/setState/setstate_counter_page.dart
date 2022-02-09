import 'package:di_and_state_management/controllers/counter_controller.dart';
import 'package:flutter/material.dart';

class SetStateCounterPage extends StatefulWidget {
  const SetStateCounterPage({Key? key}) : super(key: key);

  @override
  _SetStateCounterPageState createState() => _SetStateCounterPageState();
}

class _SetStateCounterPageState extends State<SetStateCounterPage> {
  final _counterController = CounterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_counterController.counter.toString()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counterController.increment();
                });
              },
              child: const Text('Increment Counter'),
            )
          ],
        ),
      ),
    );
  }
}
