import 'package:di_and_state_management/blocs/counter_cubit_vanilla.dart';
import 'package:flutter/material.dart';

class CounterCubitVanillaPage extends StatefulWidget {
  const CounterCubitVanillaPage({Key? key}) : super(key: key);

  @override
  _CounterCubitVanillaPageState createState() =>
      _CounterCubitVanillaPageState();
}

class _CounterCubitVanillaPageState extends State<CounterCubitVanillaPage> {
  final counterCubitVanilla = CounterCubitVanilla();

  @override
  void dispose() {
    counterCubitVanilla.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterCubitVanilla.counterStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Cubit Vanilla'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data.toString()),
                ElevatedButton(
                  onPressed: () {
                    counterCubitVanilla.increment();
                  },
                  child: const Text('Increment Counter'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
