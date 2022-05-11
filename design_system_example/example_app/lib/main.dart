import 'package:example_app/intro_page.dart';
import 'package:flutter/material.dart';

import 'themes/theme1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme1,
      home: const IntroPage(),
    );
  }
}
