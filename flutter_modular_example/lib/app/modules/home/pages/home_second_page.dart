import 'package:flutter/material.dart';

class HomeSecondPage extends StatefulWidget {
  const HomeSecondPage({Key? key}) : super(key: key);

  @override
  _HomeSecondPageState createState() => _HomeSecondPageState();
}

class _HomeSecondPageState extends State<HomeSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Second Page'),
      ),
    );
  }
}
