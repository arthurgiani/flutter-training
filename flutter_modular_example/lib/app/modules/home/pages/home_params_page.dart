import 'package:flutter/material.dart';

/// Page created to test [Modular] navigation passing parameters using args.params

class HomeParamsPage extends StatefulWidget {
  const HomeParamsPage({
    Key? key,
    required this.textParameter,
  }) : super(key: key);

  final String textParameter;

  @override
  _HomeParamsPageState createState() => _HomeParamsPageState();
}

class _HomeParamsPageState extends State<HomeParamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeParamsPage')),
      body: Center(child: Text(widget.textParameter)),
    );
  }
}
