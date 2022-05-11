import 'package:example_app/pages/button_page.dart';
import 'package:example_app/pages/text_field_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Map<String, Widget>> designSystemOptions = [
    {
      'Buttons': const ButtonPage(),
    },
    {
      'TextField': const TextFieldPage(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView.builder(
          itemCount: designSystemOptions.length,
          itemBuilder: (_, index) {
            final designSystemItem = designSystemOptions[index];
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => designSystemItem.values.elementAt(0),
                  ),
                );
              },
              child: Text(designSystemItem.keys.elementAt(0)),
            );
          },
        ),
      ),
    );
  }
}
