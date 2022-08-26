import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/state_management/bloc/bloc_counter_page.dart';
import 'package:di_and_state_management/pages/state_management/bloc/bloc_list_page.dart';
import 'package:di_and_state_management/pages/state_management/bloc/bloc_provider_list_page.dart';
import 'package:flutter/material.dart';

class BlocIntroPage extends StatefulWidget {
  const BlocIntroPage({Key? key}) : super(key: key);

  @override
  _BlocIntroPageState createState() => _BlocIntroPageState();
}

class _BlocIntroPageState extends State<BlocIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(label: 'Counter', nextWidget: CounterBlocPage()),
            CustomButton(label: 'Loading List', nextWidget: BlocListPage()),
            CustomButton(
              label: 'Loading List + BlocProvider',
              nextWidget: BlocProviderListPage(),
            )
          ],
        ),
      ),
    );
  }
}
