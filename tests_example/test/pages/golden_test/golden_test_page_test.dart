import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tests_example/pages/golden_test/golden_test_page.dart';

import '../../device.dart';

void main() {
  late DeviceBuilder deviceBuilder;

  setUp(() {
    deviceBuilder = DeviceBuilder();

    // Works only for [screenMatchesGolden] method.
    deviceBuilder.overrideDevicesForAllScenarios(devices: [
      Device.phone,
      Device.iphone11,
      Device.tabletPortrait,
      Device.tabletLandscape,
      CustomDevice.customPhone,
    ]);
  });

  testWidgets('Golden Test Page Test - Initial Scenario - Vanilla',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoldenTestPage(),
      ),
    );

    final elevatedButton = find.byKey(const Key('elevated-button'));

    await tester.tap(elevatedButton);
    await tester.pump();

    final textAfterClick = find.text('text after click on button');

    expect(textAfterClick, findsOneWidget);

    await expectLater(
      find.byType(GoldenTestPage),
      matchesGoldenFile('goldens_vanilla/golden_test_page.vanilla.png'),
    );
  });

  testGoldens('Golden Test Page Test - Initial Scenario - Device Builder',
      (tester) async {
    //arrange
    deviceBuilder.addScenario(
      name: 'GoldenTestPage on initial state',
      widget: const GoldenTestPage(),
    );

    //act
    await tester.pumpDeviceBuilder(deviceBuilder);

    //assert
    await screenMatchesGolden(tester, 'initial_state_screen');
  });

  testGoldens('Golden Test Page Test - Initial Scenario - multiScreenGolden',
      (tester) async {
    //act
    await tester.pumpWidgetBuilder(const GoldenTestPage());

    //assert
    await multiScreenGolden(tester, 'initial_state_multi_screen');
  });

  testGoldens('Golden Test Page Test - After Button click Scenario',
      (tester) async {
    //arrange
    deviceBuilder.addScenario(
        name: 'GoldenTestPage after click on ElevatedButton',
        widget: const GoldenTestPage(),
        onCreate: (scenarioKey) async {
          final elevatedButton = find.descendant(
            of: find.byKey(scenarioKey),
            matching: find.byKey(
              const Key('elevated-button'),
            ),
          );
          await tester.tap(elevatedButton);
          await tester.pump();

          final textAfterClick = find.descendant(
            of: find.byKey(scenarioKey),
            matching: find.text(
              'text after click on button',
            ),
          );

          expect(textAfterClick, findsOneWidget);
        });

    //act
    await tester.pumpDeviceBuilder(deviceBuilder);

    //assert
    await screenMatchesGolden(tester, 'golden_test_page_after_click_state');
  });
}
