import 'package:flutter/material.dart';

class ComponentizedWidgetsPage extends StatefulWidget {
  const ComponentizedWidgetsPage({Key? key}) : super(key: key);

  @override
  _ComponentizedWidgetsPageState createState() =>
      _ComponentizedWidgetsPageState();
}

class _ComponentizedWidgetsPageState extends State<ComponentizedWidgetsPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentized Widgets'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          return CheckboxListTile(
            title: Text(index.toString()),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                if (value == null) {
                  isChecked = false;
                } else {
                  isChecked = value;
                }
              });
            },
          );
        },
      ),
    );
  }
}
