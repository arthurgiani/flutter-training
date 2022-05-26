import 'package:beginner_todo_list/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoListNotifier extends ChangeNotifier {
  final List<TodoModel> todos = [];

  void addTodo({required TodoModel todo}) {
    todos.add(todo);
    notifyListeners();
  }

  void editTodo({required TodoModel todo}) {
    final todoIndex = todos.indexWhere((element) => element.id == todo.id);
    todos[todoIndex] = todo;
    notifyListeners();
  }

  void deleteTodo({required TodoModel todo}) {
    final todoIndex = todos.indexWhere((element) => element.id == todo.id);
    todos.removeAt(todoIndex);
    notifyListeners();
  }
}
