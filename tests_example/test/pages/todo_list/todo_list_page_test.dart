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

    final floatingActionButton = find.byType(FloatingActionButton);

    await tester.tap(floatingActionButton);

    await tester.pump();

    final item0 = find.byKey(const Key('list_tile_0'));

    expect(item0, findsOneWidget);

    //delete todo
    final dismissible = find.byType(Dismissible);

    await tester.drag(dismissible, const Offset(1000, 0));

    //onDissmised parameter triggers an animation to delete the item. Threfore,
    //pumpAndSettle should be used in most of cases in order to await the last
    //scheduled frame to rebuild the UI. However, since the above method is a
    //Future, we need to await the entire drag process to rebuild our UI.
    //Due this, pump can be used instead of pumpAndSettle because we are
    //assuring that pump will be called after the end of the animation.
    await tester.pumpAndSettle();

    expect(item0, findsNothing);
  });
}
