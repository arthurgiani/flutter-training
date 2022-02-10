import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:flutter/foundation.dart';

class ListChangeNotifier extends ChangeNotifier {
  final ListRepository listRepository;

  ListChangeNotifier({required this.listRepository});

  bool isLoading = false;
  bool hasError = false;
  final List<String> stringList = [];
  bool get isListLoaded =>
      isLoading == false && hasError == false && stringList.isNotEmpty;

  Future<void> getStringList() async {
    try {
      isLoading = true;
      notifyListeners();
      final list = await listRepository.getStringList();
      stringList.addAll(list);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      hasError = true;
      notifyListeners();
    }
  }
}
