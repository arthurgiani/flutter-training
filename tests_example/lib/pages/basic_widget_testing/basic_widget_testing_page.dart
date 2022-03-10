import 'package:flutter/material.dart';

class BasicWidgetTestingPage extends StatefulWidget {
  const BasicWidgetTestingPage({Key? key}) : super(key: key);

  @override
  _BasicWidgetTestingPageState createState() => _BasicWidgetTestingPageState();
}

class _BasicWidgetTestingPageState extends State<BasicWidgetTestingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Widget Testing',
          key: Key('basic_widget_testing_app_bar_title'),
        ),
      ),
      body: const Center(
        child: Text('Test Text', key: Key('basic_widget_testing_test_text')),
      ),
    );
  }
}
