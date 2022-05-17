import 'package:design_system_example/design_system_example.dart';
import 'package:example_app/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageName: 'ButtonPage',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              isEnabled: true,
              isBusy: false,
              label: 'Enabled',
              onPressed: () {
                debugPrint('Pressed');
              },
            ),
            const SizedBox(height: 16),
            MainButton(
              isEnabled: false,
              isBusy: false,
              label: 'Disabled',
              onPressed: () {
                debugPrint('Pressed');
              },
            ),
            const SizedBox(height: 16),
            MainButton(
              isEnabled: true,
              isBusy: true,
              label: 'Disabled',
              onPressed: () {
                debugPrint('Pressed');
              },
            ),
            const SizedBox(height: 16),
            MainButton.outlined(
              label: 'Outlined',
              onPressed: () {
                debugPrint('Pressed');
              },
              icon: const Icon(Icons.password),
            ),
          ],
        ),
      ),
    );
  }
}
