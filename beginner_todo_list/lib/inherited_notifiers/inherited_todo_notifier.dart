import 'package:flutter/widgets.dart';

import '../notifiers/todo_list_notifier.dart';

class InheritedTodoNotifier extends InheritedNotifier<TodoListNotifier> {
  const InheritedTodoNotifier({
    Key? key,
    required super.child,
    required TodoListNotifier notifier,
  }) : super(key: key, notifier: notifier);

  static TodoListNotifier of(BuildContext context) {
    final InheritedTodoNotifier? result =
        context.dependOnInheritedWidgetOfExactType<InheritedTodoNotifier>();

    assert(result != null, 'No InheritedTodoNotifier found in context');

    return result!.notifier!;
  }
}
