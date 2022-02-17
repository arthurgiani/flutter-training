import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/modules/home/pages/home_page.dart';
import 'package:flutter_modular_example/app/modules/home/pages/home_second_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/second-page',
          child: (context, args) => const HomeSecondPage(),
        ),
      ];
}
