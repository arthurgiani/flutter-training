import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/state_management/cubit/counter_cubit_vanilla_page.dart';
import 'package:di_and_state_management/pages/state_management/cubit/list_cubit_page.dart';
import 'package:flutter/material.dart';

import 'counter_cubit_page.dart';

class CubitIntroPage extends StatefulWidget {
  const CubitIntroPage({Key? key}) : super(key: key);

  @override
  _CubitIntroPageState createState() => _CubitIntroPageState();
}

class _CubitIntroPageState extends State<CubitIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Counter Vanilla',
              nextWidget: CounterCubitVanillaPage(),
            ),
            CustomButton(
              label: 'Counter',
              nextWidget: CounterCubitPage(),
            ),
            CustomButton(
              label: 'Loading List',
              nextWidget: ListCubitPage(),
            ),
          ],
        ),
      ),
    );
  }
}
