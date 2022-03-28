import 'package:flutter/material.dart';

import '../extensions/translate_extension.dart';

class VariableStringPage extends StatefulWidget {
  const VariableStringPage({Key? key}) : super(key: key);

  @override
  _VariableStringPageState createState() => _VariableStringPageState();
}

class _VariableStringPageState extends State<VariableStringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variable String'),
      ),
      body: Center(
        child: Text(context.translator.fakeUsername('Foo')),
      ),
    );
  }
}
