import 'package:bloc/bloc.dart';
import 'package:di_and_state_management/blocs/events/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementEvent>((event, emit) => _incrementCounter(event, emit));
  }

  _incrementCounter(CounterIncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }
}
