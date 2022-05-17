import 'package:design_system_example/design_system_example.dart';
import 'package:example_app/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const IntroPage(),
      theme: theme1,
    );
  }
}
