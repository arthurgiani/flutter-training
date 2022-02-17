import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/modules/nested/submodules/module_b/pages/module_b_page.dart';

class ModuleB extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ModuleBPage(),
        ),
      ];
}
