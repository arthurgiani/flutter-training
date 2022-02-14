import 'package:bloc/bloc.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListRepository listRepository;
  ListCubit({required this.listRepository}) : super(ListInitial());

  void getStringList() async {
    try {
      emit(ListLoading());
      final list = await listRepository.getStringList();
      emit(ListSuccess(list: list));
    } catch (error) {
      emit(ListError(errorMessage: 'Error!'));
    }
  }
}
