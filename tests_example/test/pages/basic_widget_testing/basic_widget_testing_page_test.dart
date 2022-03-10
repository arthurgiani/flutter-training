import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tests_example/pages/basic_widget_testing/basic_widget_testing_page.dart';

void main() {
  testWidgets(
      'BasicWidgtetTestingPage - find an Appbar Title and a Text in body by text ...',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasicWidgetTestingPage()));

    //find by text
    final appBarTitleFinder = find.text('Basic Widget Testing');
    final bodyTextFinder = find.text('Test Text');

    //text matcher
    expect(appBarTitleFinder, findsOneWidget);
    expect(bodyTextFinder, findsOneWidget);
  });

  testWidgets(
      'BasicWidgtetTestingPage - find an Appbar Title and a Text in body by key ...',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasicWidgetTestingPage()));

    //find by key
    final appBarTitleKey =
        find.byKey(const Key('basic_widget_testing_app_bar_title'));

    final bodyTextKey = find.byKey(const Key('basic_widget_testing_test_text'));

    //key matcher
    expect(appBarTitleKey, findsOneWidget);
    expect(bodyTextKey, findsOneWidget);
  });
}
