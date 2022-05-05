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
    return const CustomScaffold(
      pageName: 'Button Page',
      body: Center(),
    );
  }
}
