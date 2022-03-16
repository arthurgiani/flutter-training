import 'package:bloc/bloc.dart';
import 'package:tests_example/repositories/list_repository.dart';

import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  final ListRepository listRepository;
  ListCubit({required this.listRepository}) : super(ListState());

  Future<void> getStringList() async {
    try {
      emit(state.copyWith(status: ListStatus.loadingList));
      final list = await listRepository.getStringList();
      emit(state.copyWith(items: list, status: ListStatus.loadedList));
    } catch (error) {
      emit(
        state.copyWith(
          error: error.toString(),
          status: ListStatus.getStringListerror,
        ),
      );
    }
  }

  Future<void> addItem({required String item}) async {
    if (item == 'forbidden item') {
      emit(state.copyWith(status: ListStatus.addItemError));
      return;
    }
    emit(state.copyWith(status: ListStatus.addingItem));
    await Future.delayed(const Duration(seconds: 1));
    final newList = [...state.items, item];
    emit(state.copyWith(items: newList, status: ListStatus.loadedList));
  }
}
