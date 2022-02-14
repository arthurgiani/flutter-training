import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';
import 'package:flutter/foundation.dart';

class ListValueNotifier extends ValueNotifier<ListState> {
  final ListRepository listRepository;
  ListValueNotifier({required this.listRepository}) : super(ListInitial());

  void getStringList() async {
    try {
      value = ListLoading();
      final list = await listRepository.getStringList();
      value = ListSuccess(list: list);
    } on Exception {
      value = ListError(errorMessage: 'Error!');
    }
  }
}
