import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tests_example/pages/golden_test/golden_test_page.dart';

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
      matchesGoldenFile('goldens/golden_test_page.vanilla.png'),
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
    await screenMatchesGolden(
      tester,
      'initial_state_screen',
    );
  });

  testGoldens(
      'Golden Test Page Test - Initial Scenario - Device Builder - DarkMode',
      (tester) async {
    //arrange
    deviceBuilder.addScenario(
      name: 'GoldenTestPage on initial state',
      widget: const GoldenTestPage(),
    );

    //act
    await tester.pumpDeviceBuilder(
      deviceBuilder,
      wrapper: materialAppWrapper(
        theme: ThemeData.dark(),
      ),
    );
    //assert
    await screenMatchesGolden(tester, 'initial_state_screen_dark_mode');
  });
  testGoldens('Golden Test Page Test - Final Scenario - Device Builder',
      (tester) async {
    //arrange
    deviceBuilder.addScenario(
        name: 'GoldenTestPage after click on button',
        widget: const GoldenTestPage(),
        onCreate: (deviceKey) async {
          final elevatedButton = find.descendant(
            of: find.byKey(deviceKey),
            matching: find.byKey(
              const Key('elevated-button'),
            ),
          );
          await tester.tap(elevatedButton);
          await tester.pump();
          final afterClickText = find.descendant(
            of: find.byKey(deviceKey),
            matching: find.text('text after click on button'),
          );
          expect(afterClickText, findsOneWidget);
        });

    //act
    await tester.pumpDeviceBuilder(deviceBuilder);
    //assert
    await screenMatchesGolden(tester, 'final_state_screen');
  });

  testGoldens('Golden Test Page - Initial state - multiScreenGolden',
      (tester) async {
    await tester.pumpWidgetBuilder(const GoldenTestPage());

    await multiScreenGolden(tester, 'initial_state_screen_multi_screen_golden');
  });

  testGoldens('Golden Test Page - Final state - multiScreenGolden',
      (tester) async {
    await tester.pumpWidgetBuilder(const GoldenTestPage());

    await multiScreenGolden(tester, 'final_state_screen_multi_screen_golden',
        customPump: (tester) async {
      final elevatedButton = find.byKey(const Key('elevated-button'));
      await tester.tap(elevatedButton);
      await tester.pump();
      final afterClickText = find.text('text after click on button');
      expect(afterClickText, findsOneWidget);
    });
  });
}
