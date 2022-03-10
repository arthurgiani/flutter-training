import 'package:flutter/material.dart';

class ScrollingTestPage extends StatefulWidget {
  const ScrollingTestPage({Key? key}) : super(key: key);

  @override
  _ScrollingTestPageState createState() => _ScrollingTestPageState();
}

class _ScrollingTestPageState extends State<ScrollingTestPage> {
  late final List<String> list;

  @override
  void initState() {
    super.initState();
    list = List<String>.generate(100, (index) => '$index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Test'),
      ),
      body: ListView.builder(
        // Add a key to the ListView. This makes it possible to
        // find the list and scroll through it in the tests.
        key: const Key('long_list'),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final text = list[index];
          return ListTile(
            title: Text(
              text,
              // Add a key to the Text widget for each item. This makes
              // it possible to look for a particular item in the list
              // and verify that the text is correct
              key: Key('item_${index}_text'),
            ),
          );
        },
      ),
    );
  }
}
