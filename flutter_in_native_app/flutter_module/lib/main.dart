import 'package:flutter/material.dart';
import 'package:flutter_module/home_page.dart';
import 'package:flutter_module/second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const FirstPage(),
            );
          case '/second':
            return MaterialPageRoute(
              builder: (context) => const SecondPage(),
            );
        }
        return null;
      },
    );
  }
}
