import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/state_management/bloc/bloc_intro_page.dart';
import 'package:di_and_state_management/pages/state_management/cubit/cubit_intro_page.dart';
import 'package:di_and_state_management/pages/state_management/setState/setstate_intro_page.dart';
import 'package:di_and_state_management/pages/state_management/value_notifier/value_notifier_intro_page.dart';
import 'package:flutter/material.dart';

import 'change_notifier/change_notifier_intro_page.dart';

class StateManagementIntroPage extends StatefulWidget {
  const StateManagementIntroPage({Key? key}) : super(key: key);

  @override
  _StateManagementIntroPageState createState() =>
      _StateManagementIntroPageState();
}

class _StateManagementIntroPageState extends State<StateManagementIntroPage> {
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
              label: 'setState',
              nextWidget: SetStateIntroPage(),
            ),
            CustomButton(
              label: 'ChangeNotifier',
              nextWidget: ChangeNotifierIntroPage(),
            ),
            CustomButton(
              label: 'Cubit',
              nextWidget: CubitIntroPage(),
            ),
            CustomButton(
              label: 'Bloc',
              nextWidget: BlocIntroPage(),
            ),
            CustomButton(
              label: 'ValueNotifier',
              nextWidget: ValueNotifierIntroPage(),
            ),
          ],
        ),
      ),
    );
  }
}
