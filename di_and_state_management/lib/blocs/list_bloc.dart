import 'package:bloc/bloc.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';

import 'events/list_event.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository listRepository;
  ListBloc({required this.listRepository}) : super(ListInitial()) {
    on<GetListEvent>((event, emit) => _getList(event, emit));
  }

  _getList(GetListEvent event, Emitter<ListState> emit) async {
    try {
      emit(ListLoading());
      final list = await listRepository.getStringList();
      emit(ListSuccess(list: list));
    } catch (error) {
      emit(ListError(errorMessage: 'Error!'));
    }
  }
}
