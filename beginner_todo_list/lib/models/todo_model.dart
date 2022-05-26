class TodoModel {
  final String id;
  String name;
  bool isDone;

  TodoModel({
    required this.name,
    required this.isDone,
  }) : id = DateTime.now().toString();
}
