import 'package:class_widgets/components/custom_button.dart';
import 'package:class_widgets/pages/layout_examples/layout_examples_page.dart';
import 'package:class_widgets/pages/widgets/componentized_widgets_page.dart';
import 'package:class_widgets/pages/widgets/inherited_widget_page.dart';
import 'package:class_widgets/pages/widgets/sandbox_page.dart';
import 'package:class_widgets/pages/widgets/render_object_page.dart';
import 'package:class_widgets/pages/widgets/stateful_widget_lifecycle_page.dart';
import 'package:flutter/material.dart';

class WidgetsIntroPage extends StatefulWidget {
  const WidgetsIntroPage({Key? key}) : super(key: key);

  @override
  _WidgetsIntroPageState createState() => _WidgetsIntroPageState();
}

class _WidgetsIntroPageState extends State<WidgetsIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Render Object',
              nextWidget: RenderObjectPage(),
            ),
            CustomButton(
              label: 'Stateful Widget Lifecycicle',
              nextWidget: StatefulWidgetLifecyclePage(),
            ),
            CustomButton(
              label: 'Componentized Widgets',
              nextWidget: ComponentizedWidgetsPage(),
            ),
            CustomButton(
              label: 'InheritedWidget',
              nextWidget: InheritedWidgetPage(),
            ),
            CustomButton(
              label: 'ListView Constraints Example',
              nextWidget: ListViewConstraintsPage(),
            ),
            CustomButton(
              label: 'Layout Examples',
              nextWidget: LayoutExamplesPage(),
            ),
          ],
        ),
      ),
    );
  }
}
