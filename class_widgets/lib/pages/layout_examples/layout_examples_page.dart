import 'package:class_widgets/components/custom_button.dart';
import 'package:class_widgets/pages/layout_examples/90_style/page.dart';
import 'package:class_widgets/pages/layout_examples/bigmac/bigmac_page.dart';
import 'package:flutter/material.dart';

class LayoutExamplesPage extends StatelessWidget {
  const LayoutExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Examples Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: '90s Style Page',
              nextWidget: StylePage(),
            ),
            CustomButton(
              label: 'Bigmac Page',
              nextWidget: BigMacPage(),
            ),
          ],
        ),
      ),
    );
  }
}
