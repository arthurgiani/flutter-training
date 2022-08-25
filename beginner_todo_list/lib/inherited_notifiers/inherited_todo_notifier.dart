import 'package:flutter/widgets.dart';

import '../notifiers/todo_list_notifier.dart';

class InheritedTodoNotifier extends InheritedNotifier<TodoListNotifier> {
  const InheritedTodoNotifier({
    Key? key,
    required super.child,
    required TodoListNotifier notifier,
  }) : super(key: key, notifier: notifier);

  static TodoListNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedTodoNotifier>()!
        .notifier!;
  }
}
