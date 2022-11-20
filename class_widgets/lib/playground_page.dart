import 'package:flutter/material.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: Column(
        children: const [
          TestButton(name: 'Arthur'),
        ],
      ),
    );
  }
}

class TestButton extends StatefulWidget {
  const TestButton({super.key, required this.name});

  final String name;

  @override
  State<TestButton> createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  Color color = Colors.blue;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        counter++;
        if (counter == 3) {
          setState(() {
            color = Colors.red;
          });
        }
      },
      child: Container(
        height: 100,
        width: 100,
        color: color,
        child: Text(widget.name),
      ),
    );
  }
}
