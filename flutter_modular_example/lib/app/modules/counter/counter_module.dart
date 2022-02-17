import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/modules/counter/pages/counter_page.dart';
import 'package:flutter_modular_example/app/modules/counter/value_notifiers/counter_notifier.dart';

class CounterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => CounterNotifier(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => CounterPage(
            counterNotifier: Modular.get<CounterNotifier>(),
          ),
        ),
      ];
}
