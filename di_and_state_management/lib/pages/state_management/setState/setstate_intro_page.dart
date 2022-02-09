import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/state_management/setState/setstate_counter_page.dart';
import 'package:di_and_state_management/pages/state_management/setState/setstate_list_page.dart';
import 'package:flutter/material.dart';

class SetStateIntroPage extends StatefulWidget {
  const SetStateIntroPage({Key? key}) : super(key: key);

  @override
  _SetStateIntroPageState createState() => _SetStateIntroPageState();
}

class _SetStateIntroPageState extends State<SetStateIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Counter',
              nextWidget: SetStateCounterPage(),
            ),
            CustomButton(
              label: 'Loading List',
              nextWidget: SetStateListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
