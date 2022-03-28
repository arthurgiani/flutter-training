import 'package:flutter/material.dart';

import '../extensions/translate_extension.dart';

class HelloWorldPage extends StatefulWidget {
  const HelloWorldPage({Key? key}) : super(key: key);

  @override
  _HelloWorldPageState createState() => _HelloWorldPageState();
}

class _HelloWorldPageState extends State<HelloWorldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Center(child: Text(context.translator.helloWorld)),
    );
  }
}
