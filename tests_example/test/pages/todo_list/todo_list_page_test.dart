import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/pages/todo_list/todo_list_page.dart';

void main() {
  testWidgets('check if a todo is been added and deleted', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TodoList(),
      ),
    );

    //Add todo
    final textField = find.byType(TextField);

    await tester.enterText(textField, 'first todo');

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text('first todo'), findsOneWidget);

    //delete todo
    final dismissible = find.byType(Dismissible);

    await tester.drag(dismissible, const Offset(1000, 0));

    await tester.pumpAndSettle();

    expect(find.text('first todo'), findsNothing);
  });
}
