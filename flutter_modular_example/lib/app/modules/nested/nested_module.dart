import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/modules/nested/pages/nested_page.dart';
import 'package:flutter_modular_example/app/modules/nested/submodules/module_a/module_a.dart';
import 'package:flutter_modular_example/app/modules/nested/submodules/module_b/module_b.dart';

class NestedModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const NestedPage(),
          children: [
            ModuleRoute(
              '/module-a/',
              module: ModuleA(),
            ),
            ModuleRoute(
              '/module-b/',
              module: ModuleB(),
            ),
          ],
        ),
      ];
}
