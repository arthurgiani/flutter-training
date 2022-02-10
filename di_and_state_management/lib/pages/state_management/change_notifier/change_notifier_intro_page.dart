import 'package:di_and_state_management/components/custom_button.dart';
import 'package:di_and_state_management/notifiers/counter_notifier.dart';
import 'package:di_and_state_management/notifiers/list_change_notifier.dart';
import 'package:di_and_state_management/pages/state_management/change_notifier/change_notifier_provider_list_page.dart';
import 'package:di_and_state_management/pages/state_management/change_notifier/change_notifier_vanilla_list_page.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_notifier_counter_page.dart';

class ChangeNotifierIntroPage extends StatefulWidget {
  const ChangeNotifierIntroPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierIntroPageState createState() =>
      _ChangeNotifierIntroPageState();
}

class _ChangeNotifierIntroPageState extends State<ChangeNotifierIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              label: 'Counter',
              nextWidget: ChangeNotifierProvider(
                create: (context) => CounterNotifier(),
                child: const ChangeNotifierCounterPage(),
              ),
            ),
            CustomButton(
              label: 'Loading List + Provider (context.watch<T>())',
              nextWidget: ChangeNotifierProvider<ListChangeNotifier>(
                create: (context) =>
                    ListChangeNotifier(listRepository: ListRepository())
                      ..getStringList(),
                child: const ChangeNotifierProviderListPage(),
              ),
            ),
            const CustomButton(
              label: 'Vanilla Loading List',
              nextWidget: ChangeNotifierVanillaListPage(),
            )
          ],
        ),
      ),
    );
  }
}
