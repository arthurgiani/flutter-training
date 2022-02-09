import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/models/text_a.dart';
import 'package:di_and_state_management/models/text_b.dart';
import 'package:di_and_state_management/pages/dependency_injection/provider/multi_provider_page.dart';
import 'package:di_and_state_management/pages/dependency_injection/provider/single_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderIntroPage extends StatefulWidget {
  const ProviderIntroPage({Key? key}) : super(key: key);

  @override
  _ProviderIntroPageState createState() => _ProviderIntroPageState();
}

class _ProviderIntroPageState extends State<ProviderIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              label: 'SingleProvider',
              //SingleProviderPage is wrapped inside a provider,
              //So evvvery widget below will have access to the class
              //that provider is 'providing'
              nextWidget: Provider(
                create: (context) => TextA(text: 'TextA'),
                child: const SingleProviderPage(),
              ),
            ),
            CustomButton(
              label: 'MultiProvider',
              //MultiProvider allows you to 'provide' more than one instance
              //of different classes
              nextWidget: MultiProvider(
                providers: [
                  Provider(create: (context) => TextA(text: 'TextA')),
                  Provider(create: (context) => TextB(text: 'TextB')),
                ],
                child: const MultiProviderPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
