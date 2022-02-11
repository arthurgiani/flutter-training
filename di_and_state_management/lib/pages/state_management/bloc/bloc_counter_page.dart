import 'package:di_and_state_management/blocs/counter_bloc.dart';
import 'package:di_and_state_management/blocs/events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatefulWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  _CounterBlocPageState createState() => _CounterBlocPageState();
}

class _CounterBlocPageState extends State<CounterBlocPage> {
  final counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      bloc: counterBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Bloc'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(state.toString()),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
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
