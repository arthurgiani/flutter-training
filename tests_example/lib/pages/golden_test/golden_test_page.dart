import 'package:flutter/material.dart';

class GoldenTestPage extends StatefulWidget {
  const GoldenTestPage({Key? key}) : super(key: key);

  @override
  _GoldenTestPageState createState() => _GoldenTestPageState();
}

class _GoldenTestPageState extends State<GoldenTestPage> {
  String currentText = 'text before click on button';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golden Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            key: const Key('golden-test-text'),
            child: Text(currentText),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            key: const Key('elevated-button'),
            onPressed: () {
              setState(() {
                currentText = 'text after click on button';
              });
            },
            child: const Text('Change Text'),
          )
        ],
      ),
    );
  }
}
