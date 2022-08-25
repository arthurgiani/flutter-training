import 'package:beginner_todo_list/pages/add_todo_page.dart';
import 'package:beginner_todo_list/widgets/edit_todo_dialog_widget.dart';
import 'package:flutter/material.dart';

import '../inherited_notifiers/inherited_todo_notifier.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: const _TodoListBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTodoPage(),
            ),
          );
        },
      ),
    );
  }
}

class _TodoListBody extends StatelessWidget {
  const _TodoListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoListNotifier = InheritedTodoNotifier.of(context);
    if (todoListNotifier.todos.isEmpty) {
      return const Center(
        child: Text('Add a todo'),
      );
    } else {
      return ListView.builder(
        itemCount: todoListNotifier.todos.length,
        itemBuilder: (_, index) {
          final todo = todoListNotifier.todos[index];
          return ListTile(
            title: Text(todo.name),
            trailing: Row(
              /// Forces [Row] to have minimum size otherwise an error
              /// is raised.
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoListNotifier.deleteTodo(todo: todo);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return EditTodoDialogWidget(todo: todo);
                      },
                    );
                  },
                ),
              ],
            ),
            leading: Checkbox(
              value: todo.isDone,
              onChanged: (value) {
                todo.isDone = value ?? false;
                todoListNotifier.editTodo(todo: todo);
              },
            ),
          );
        },
      );
    }
  }
}
