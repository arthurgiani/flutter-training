import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/pages/scrolling_test_page/scrolling_test_page.dart';

void main() {
  testWidgets('ScrollingTestPage - check if list last item exists ...',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ScrollingTestPage(),
      ),
    );

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const Key('item_99_text'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
