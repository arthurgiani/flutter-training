import 'package:design_system_example/design_system_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('MainButton Enabled/Disabled/Outlined - Theme1', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
    );

    builder.addScenario(
      'Main Button - Enabled',
      MainButton(
        isEnabled: true,
        isBusy: false,
        label: 'enabled',
        onPressed: () {},
      ),
    );

    builder.addScenario(
      'Main Button - Disabled',
      MainButton(
        isEnabled: false,
        isBusy: false,
        label: 'enabled',
        onPressed: () {},
      ),
    );

    builder.addScenario(
      'Main Button - Outlined',
      MainButton.outlined(
        label: 'enabled',
        icon: const Icon(Icons.exit_to_app),
        onPressed: () {},
      ),
    );

    await tester.pumpWidgetBuilder(
      builder.build(),
      wrapper: materialAppWrapper(theme: theme1),
    );

    await screenMatchesGolden(tester, 'main_button_static_theme1');
  });

  testGoldens('MainButton Enabled/Disabled/Outlined - Theme2', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
    );

    builder.addScenario(
      'Main Button - Enabled',
      MainButton(
        isEnabled: true,
        isBusy: false,
        label: 'enabled',
        onPressed: () {},
      ),
    );

    builder.addScenario(
      'Main Button - Disabled',
      MainButton(
        isEnabled: false,
        isBusy: false,
        label: 'enabled',
        onPressed: () {},
      ),
    );

    builder.addScenario(
      'Main Button - Outlined',
      MainButton.outlined(
        label: 'enabled',
        icon: const Icon(Icons.exit_to_app),
        onPressed: () {},
      ),
    );

    await tester.pumpWidgetBuilder(
      builder.build(),
      wrapper: materialAppWrapper(theme: theme2),
    );

    await screenMatchesGolden(tester, 'main_button_static_theme2');
  });

  testWidgets('Main Button - No packages - Theme1', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme1,
        home: Scaffold(
          body: Column(
            children: [
              MainButton(
                isEnabled: true,
                isBusy: true,
                label: 'Loading',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton(
                isEnabled: true,
                isBusy: false,
                label: 'Enabled',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton(
                isEnabled: false,
                isBusy: false,
                label: 'Disabled',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton.outlined(
                icon: const Icon(Icons.ad_units),
                label: 'Outlined',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/main_button_vanilla_theme1.png'),
    );
  });

  testWidgets('Main Button - Vanilla - Theme2', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme2,
        home: Scaffold(
          body: Column(
            children: [
              MainButton(
                isEnabled: true,
                isBusy: true,
                label: 'Loading',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton(
                isEnabled: true,
                isBusy: false,
                label: 'Loading',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton(
                isEnabled: false,
                isBusy: false,
                label: 'Loading',
                onPressed: () {},
              ),
              const SizedBox(height: 32),
              MainButton.outlined(
                icon: const Icon(Icons.ad_units),
                label: 'Loading',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/main_button_vanilla_theme2.png'),
    );
  });
}
