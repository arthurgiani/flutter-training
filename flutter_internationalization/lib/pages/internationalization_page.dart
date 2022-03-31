import 'package:flutter/material.dart';
import 'package:flutter_internationalization/components/custom_button.dart';
import 'package:flutter_internationalization/pages/currency_page.dart';
import 'package:flutter_internationalization/pages/datetime_page.dart';
import 'package:flutter_internationalization/pages/directionality_page.dart';
import 'package:flutter_internationalization/pages/gender_page.dart';
import 'package:flutter_internationalization/pages/plural_page.dart';
import 'package:flutter_internationalization/pages/remote_config_page.dart';
import 'package:flutter_internationalization/pages/variable_string_page.dart';

import 'hello_world_page.dart';

class InternationalizationPage extends StatefulWidget {
  const InternationalizationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InternationalizationPage> createState() =>
      _InternationalizationPageState();
}

class _InternationalizationPageState extends State<InternationalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Hello World',
              nextWidget: HelloWorldPage(),
            ),
            CustomButton(
              label: 'Variable String',
              nextWidget: VariableStringPage(),
            ),
            CustomButton(
              label: 'Plural',
              nextWidget: PluralPage(),
            ),
            CustomButton(
              label: 'Gender',
              nextWidget: GenderPage(),
            ),
            CustomButton(
              label: 'Currency',
              nextWidget: CurrencyPage(),
            ),
            CustomButton(
              label: 'DateTime',
              nextWidget: DateTimePage(),
            ),
            CustomButton(
              label: 'Directionality',
              nextWidget: DirectionalityPage(),
            ),
            CustomButton(
              label: 'Remote Config',
              nextWidget: RemoteConfigPage(),
            ),
          ],
        ),
      ),
    );
  }
}
