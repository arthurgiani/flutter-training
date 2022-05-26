import 'package:beginner_todo_list/notifiers/todo_list_notifier.dart';
import 'package:beginner_todo_list/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [ChangeNotifier] available on every widget tree

    return ChangeNotifierProvider<TodoListNotifier>(
      create: (context) => TodoListNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoListPage(),
      ),
    );
  }
}
