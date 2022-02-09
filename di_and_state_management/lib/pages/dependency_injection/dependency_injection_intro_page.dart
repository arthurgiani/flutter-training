import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/pages/dependency_injection/provider/provider_intro_page.dart';
import 'package:flutter/material.dart';

class DependencyInjectionIntroPage extends StatefulWidget {
  const DependencyInjectionIntroPage({Key? key}) : super(key: key);

  @override
  _DependencyInjectionIntroPageState createState() =>
      _DependencyInjectionIntroPageState();
}

class _DependencyInjectionIntroPageState
    extends State<DependencyInjectionIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependency Injection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Provider',
              nextWidget: ProviderIntroPage(),
            ),
          ],
        ),
      ),
    );
  }
}
