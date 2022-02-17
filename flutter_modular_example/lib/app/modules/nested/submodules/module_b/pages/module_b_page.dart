import 'package:flutter/material.dart';

class ModuleBPage extends StatefulWidget {
  const ModuleBPage({Key? key}) : super(key: key);

  @override
  _ModuleBPageState createState() => _ModuleBPageState();
}

class _ModuleBPageState extends State<ModuleBPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ModuleB AppBar'),
      ),
    );
  }
}
