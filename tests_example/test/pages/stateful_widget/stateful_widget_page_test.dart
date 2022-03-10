import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/pages/stateful_widget/stateful_widget_page.dart';

void main() {
  testWidgets(
      'StatefulWidgetPage - check if container color changes after tap in FAB',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StatefulWidgetPage(),
      ),
    );

    final greenContainer = find.byWidgetPredicate(
        (widget) => widget is Container && widget.color == Colors.green);
    expect(greenContainer, findsOneWidget);

    //find, tap the button and rebuild the UI
    final changeContainerColorButton = find.byType(FloatingActionButton);
    await tester.tap(changeContainerColorButton);
    await tester.pump();

    final redContainer = find.byWidgetPredicate(
        (widget) => widget is Container && widget.color == Colors.red);
    expect(redContainer, findsOneWidget);
    expect(greenContainer, findsNothing);
  });
}
