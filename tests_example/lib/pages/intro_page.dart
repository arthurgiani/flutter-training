import 'package:flutter/material.dart';
import 'package:tests_example/components/custom_button.dart';
import 'package:tests_example/pages/basic_widget_testing/basic_widget_testing_page.dart';
import 'package:tests_example/pages/scrolling_test_page/scrolling_test_page.dart';
import 'package:tests_example/pages/stateful_widget/stateful_widget_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Simple Widget Testing',
              nextWidget: BasicWidgetTestingPage(),
            ),
            CustomButton(
              label: 'Scrolling Test',
              nextWidget: ScrollingTestPage(),
            ),
            CustomButton(
              label: 'Stateful Widget Test',
              nextWidget: StatefulWidgetPage(),
            )
          ],
        ),
      ),
    );
  }
}
