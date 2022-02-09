import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/notifiers/counter_notifier.dart';
import 'package:di_and_state_management/pages/state_management/change_notifier/change_notifier_counter_page.dart';
import 'package:di_and_state_management/pages/state_management/setState/setstate_intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          children: <Widget>[
            const CustomButton(
              label: 'setState',
              nextWidget: SetStateIntroPage(),
            ),
            CustomButton(
              label: 'ChangeNotifier',
              nextWidget: ChangeNotifierProvider(
                create: (context) => CounterNotifier(),
                child: const ChangeNotifierCounterPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
