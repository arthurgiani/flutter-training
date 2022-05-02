import 'package:flutter/material.dart';
import 'package:tests_example/components/custom_button.dart';
import 'package:tests_example/pages/animations/animation_intro_page.dart';
import 'package:tests_example/pages/basic_widget_testing/basic_widget_testing_page.dart';
import 'package:tests_example/pages/golden_test/golden_test_page.dart';
import 'package:tests_example/pages/pages_with_dependencies/dependencies_intro_page.dart';
import 'package:tests_example/pages/scrolling_test_page/scrolling_test_page.dart';
import 'package:tests_example/pages/stateful_widget/stateful_widget_page.dart';
import 'package:tests_example/pages/todo_list/todo_list_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
            ),
            CustomButton(
              label: 'Todo List',
              nextWidget: TodoList(),
            ),
            CustomButton(
              label: 'Animation',
              nextWidget: AnimationIntroPage(),
            ),
            CustomButton(
              label: 'Pages with dependencies',
              nextWidget: DependenciesIntroPage(),
            ),
            CustomButton(
              label: 'Golden Test',
              nextWidget: GoldenTestPage(),
            )
          ],
        ),
      ),
    );
  }
}
