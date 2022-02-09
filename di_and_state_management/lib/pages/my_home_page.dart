import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/state_management/state_management_intro_page.dart';
import 'package:flutter/material.dart';

import 'dependency_injection/dependency_injection_intro_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Dependency Injection',
              nextWidget: DependencyInjectionIntroPage(),
            ),
            CustomButton(
              label: 'State Management',
              nextWidget: StateManagementIntroPage(),
            )
          ],
        ),
      ),
    );
  }
}
