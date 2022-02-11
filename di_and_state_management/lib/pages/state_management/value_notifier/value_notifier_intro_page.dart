import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/notifiers/counter_value_notifier.dart';
import 'package:di_and_state_management/pages/state_management/value_notifier/value_notifier_counter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueNotifierIntroPage extends StatefulWidget {
  const ValueNotifierIntroPage({Key? key}) : super(key: key);

  @override
  _ValueNotifierIntroPageState createState() => _ValueNotifierIntroPageState();
}

class _ValueNotifierIntroPageState extends State<ValueNotifierIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              label: 'Counter',
              nextWidget: ChangeNotifierProvider(
                create: (context) => CounterValueNotifier(),
                child: const ValueNotifierCounterPage(),
              ),
            ),
            //CustomButton(
            //  label: 'Loading List (TripleState)',
            //  nextWidget: SetStateListPage(),
            //),
          ],
        ),
      ),
    );
  }
}
