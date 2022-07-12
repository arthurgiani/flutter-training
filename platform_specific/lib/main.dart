import 'package:flutter/material.dart';
import 'package:platform_specific/components/custom_button.dart';
import 'package:platform_specific/pages/get_battery_level_page.dart';
import 'package:platform_specific/pages/int_list_example.dart';
import 'package:platform_specific/pages/json_example_page.dart';
import 'package:platform_specific/pages/map_example_page.dart';
import 'package:platform_specific/pages/method_with_parameters.dart';
import 'package:platform_specific/pages/stream_example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 30),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomButton(
              label: 'Get Battery Level',
              nextWidget: GetBatteryLevelPage(),
            ),
            CustomButton(
              label: 'Method With Parameters',
              nextWidget: MethodWithParameters(),
            ),
            CustomButton(
              label: 'Int List Example',
              nextWidget: IntListExamplePage(),
            ),
            CustomButton(
              label: 'Map Example Page',
              nextWidget: MapExamplePage(),
            ),
            CustomButton(
              label: 'Json Example Page',
              nextWidget: JsonExamplePage(),
            ),
            CustomButton(
              label: 'Stream Example Page',
              nextWidget: StreamExamplePage(),
            )
          ],
        ),
      ),
    );
  }
}
