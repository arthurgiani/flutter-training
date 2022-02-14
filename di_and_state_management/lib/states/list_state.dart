/// States to be used in both [Bloc] and [ValueNotifier]

abstract class ListState {}

class ListInitial implements ListState {}

class ListLoading implements ListState {}

class ListSuccess implements ListState {
  final List<String> list;

  ListSuccess({required this.list});
}

class ListError implements ListState {
  final String errorMessage;

  ListError({required this.errorMessage});
}
