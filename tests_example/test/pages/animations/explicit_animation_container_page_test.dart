import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/pages/animations/explicit_animation_container_page.dart';

void main() {
  testWidgets("""ExplicitAnimationContainerPage - check if Padding
                is increased by 10 when FAB is pressed and the reverse the animation
                after presses FAB again ...""", (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ExplicitAnimationContainerPage(),
    ));

    final firstContainer = find.byWidgetPredicate((widget) =>
        widget is Container && widget.padding == const EdgeInsets.all(10));

    expect(firstContainer, findsOneWidget);

    final floatActionButton = find.byType(FloatingActionButton);

    //init animation
    await tester.tap(floatActionButton);
    await tester.pumpAndSettle();

    final secondContainer = find.byWidgetPredicate((widget) =>
        widget is Container && widget.padding == const EdgeInsets.all(20));

    expect(secondContainer, findsOneWidget);

    //reverse animation
    await tester.tap(floatActionButton);
    await tester.pumpAndSettle();

    expect(firstContainer, findsOneWidget);
  });
}
