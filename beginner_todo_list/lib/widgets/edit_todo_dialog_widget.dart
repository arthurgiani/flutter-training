import 'package:beginner_todo_list/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/todo_list_notifier.dart';

class EditTodoDialogWidget extends StatefulWidget {
  const EditTodoDialogWidget({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  State<EditTodoDialogWidget> createState() => _EditTodoDialogWidgetState();
}

class _EditTodoDialogWidgetState extends State<EditTodoDialogWidget> {
  late final TextEditingController todoNameTextController;

  @override
  void initState() {
    todoNameTextController = TextEditingController(text: widget.todo.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoListNotifier = context.read<TodoListNotifier>();
    return AlertDialog(
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () {
            widget.todo.name = todoNameTextController.text;
            todoListNotifier.editTodo(todo: widget.todo);
            Navigator.pop(context);
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Edit todo name'),
            const SizedBox(height: 16),
            TextField(controller: todoNameTextController),
          ],
        ),
      ),
    );
  }
}
