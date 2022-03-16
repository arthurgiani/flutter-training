import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late final List<String> todos;
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    todos = [];
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(label: Text('todo')),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, index) {
                  final todo = todos[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) => todos.removeAt(index),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        key: Key('list_tile_$index'),
                        title: Text(todo),
                      ),
                    ),
                    background: Container(color: Colors.red),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(textController.text);
            textController.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
