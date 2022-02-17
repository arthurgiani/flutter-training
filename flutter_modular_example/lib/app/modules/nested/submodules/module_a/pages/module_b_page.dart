import 'package:flutter/material.dart';

class ModuleAPage extends StatefulWidget {
  const ModuleAPage({Key? key}) : super(key: key);

  @override
  _ModuleAPageState createState() => _ModuleAPageState();
}

class _ModuleAPageState extends State<ModuleAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ModuleA AppBar'),
      ),
    );
  }
}
