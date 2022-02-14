import 'dart:async';

class CounterCubitVanilla {
  int counter = 0;
  final _counterStreamController = StreamController<int>();

  Sink<int> get _counterSink => _counterStreamController.sink;
  Stream<int> get counterStream => _counterStreamController.stream;

  void increment() {
    counter++;
    _counterSink.add(counter);
  }
}
