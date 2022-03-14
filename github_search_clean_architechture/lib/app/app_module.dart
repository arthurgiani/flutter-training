import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_clean_architechture/app/modules/search/search_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: SearchModule())];
}
