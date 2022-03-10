import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({Key? key}) : super(key: key);

  @override
  _StatefulWidgetPageState createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  bool isGreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Test'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: isGreen ? Colors.green : Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'stateful_widget_page_floating_action_button',
        child: const Icon(Icons.swap_horiz),
        onPressed: () {
          setState(() {
            isGreen = !isGreen;
          });
        },
      ),
    );
  }
}
