import 'package:di_and_state_management/repositories/list_repository.dart';

class ListController {
  final ListRepository listRepository;

  ListController({required this.listRepository});

  bool isLoading = false;
  final List<String> stringList = [];

  Future<void> getStringList() async {
    isLoading = true;
    final list = await listRepository.getStringList();
    stringList.addAll(list);
    isLoading = false;
  }
}
