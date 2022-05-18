import 'package:design_system_example/design_system_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

/// [InputDecorationTheme] is the same for both [theme1] and [theme2].
///
/// Therefore, only one scenario is necessary to test.

void main() {
  testGoldens('MainTextField - All Scenarios - Theme1', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 3,
      widthToHeightRatio: 1,
    );

    builder.addScenario(
      'With leading / trailling',
      MainTextField(
        textController: TextEditingController(),
        hintText: 'With leading / trailling',
        leading: const Icon(Icons.clear),
        trailling: const Icon(Icons.clear),
        onTraillingPressed: () {},
      ),
    );

    builder.addScenario(
      'With leading',
      MainTextField(
        textController: TextEditingController(),
        hintText: 'With leading',
        leading: const Icon(Icons.clear),
        onTraillingPressed: () {},
      ),
    );

    builder.addScenario(
      'With trailling',
      MainTextField(
        textController: TextEditingController(),
        hintText: 'With trailling',
        trailling: const Icon(Icons.clear),
        onTraillingPressed: () {},
      ),
    );

    builder.addScenario(
      'No leading and trailling',
      MainTextField(
        textController: TextEditingController(),
        hintText: 'No leading and trailling',
        onTraillingPressed: () {},
      ),
    );

    builder.addScenario(
      'Obscure',
      MainTextField(
        isObscure: true,
        textController: TextEditingController(text: 'obscure text'),
        hintText: 'With leading / trailling',
        leading: const Icon(Icons.clear),
        trailling: const Icon(Icons.clear),
        onTraillingPressed: () {},
      ),
    );

    await tester.pumpWidgetBuilder(
      builder.build(),
      wrapper: materialAppWrapper(theme: theme1),
    );

    await screenMatchesGolden(tester, 'main_text_field_theme1');
  });

  testWidgets('Main Text - Vanilla - Theme1', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme1,
        home: Scaffold(
          body: Column(
            children: [
              MainTextField(
                textController: TextEditingController(),
                hintText: 'No leading / trailling',
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: TextEditingController(),
                hintText: 'Leading',
                leading: const Icon(Icons.clear),
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: TextEditingController(),
                hintText: 'Trailling',
                trailling: const Icon(Icons.clear),
                onTraillingPressed: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: TextEditingController(),
                hintText: 'With leading / trailling',
                leading: const Icon(Icons.clear),
                trailling: const Icon(Icons.clear),
                onTraillingPressed: () {},
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: TextEditingController(text: 'obscure text'),
                hintText: 'Obscure',
                isObscure: true,
                trailling: const Icon(Icons.clear),
                onTraillingPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pump();

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/main_text_field_vanilla_theme1.png'),
    );
  });
}
