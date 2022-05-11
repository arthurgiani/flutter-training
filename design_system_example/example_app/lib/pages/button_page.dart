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
      pageName: 'Button Page',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Enabled'),
              const SizedBox(height: 16),
              MainButton(
                isEnabled: true,
                isBusy: false,
                label: 'Enabled',
                onPressed: () {
                  debugPrint('1');
                },
              ),
              const SizedBox(height: 32),
              const Text('Busy'),
              const SizedBox(height: 16),
              MainButton(
                isEnabled: true,
                isBusy: true,
                onPressed: () {
                  debugPrint('2');
                },
              ),
              const SizedBox(height: 32),
              const Text('Disabled'),
              const SizedBox(height: 16),
              MainButton(
                isEnabled: false,
                isBusy: false,
                label: 'Disabled',
                onPressed: () {
                  debugPrint('3');
                },
              ),
              const SizedBox(height: 32),
              const Text('Outlined'),
              const SizedBox(height: 16),
              MainButton.outlined(
                icon: Icons.exit_to_app,
                label: 'Outlined',
                onPressed: () {
                  debugPrint('4');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
