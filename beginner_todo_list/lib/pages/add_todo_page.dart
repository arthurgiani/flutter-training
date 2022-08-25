import 'package:beginner_todo_list/models/todo_model.dart';
import 'package:flutter/material.dart';

import '../inherited_notifiers/inherited_todo_notifier.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  bool isDone = false;

  final TextEditingController todoNameTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoListNotifier = InheritedTodoNotifier.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: todoNameTextFieldController,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is todo done?'),
                Checkbox(
                  value: isDone,
                  onChanged: (value) {
                    setState(() {
                      isDone = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          final todo = TodoModel(
            name: todoNameTextFieldController.text,
            isDone: isDone,
          );

          todoListNotifier.addTodo(todo: todo);

          Navigator.pop(context);
        },
      ),
    );
  }
}
