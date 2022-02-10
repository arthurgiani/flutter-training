import 'package:di_and_state_management/blocs/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatefulWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  _CounterCubitPageState createState() => _CounterCubitPageState();
}

class _CounterCubitPageState extends State<CounterCubitPage> {
  final counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      bloc: counterCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Cubit'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(state.toString()),
                ElevatedButton(
                  onPressed: () {
                    counterCubit.increment();
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
