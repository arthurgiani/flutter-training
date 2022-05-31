import 'package:flutter/material.dart';

/// Page created to test [Modular] navigation passing parameters using args.params

class HomeQueryParamsPage extends StatefulWidget {
  const HomeQueryParamsPage({
    Key? key,
    required this.textParameter,
  }) : super(key: key);

  final String textParameter;

  @override
  _HomeQueryParamsPageState createState() => _HomeQueryParamsPageState();
}

class _HomeQueryParamsPageState extends State<HomeQueryParamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeQueryParamsPage')),
      body: Center(child: Text(widget.textParameter)),
    );
  }
}
