import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests_example/blocs/list_cubit.dart';
import 'package:tests_example/components/custom_button.dart';
import 'package:tests_example/pages/pages_with_dependencies/cubit_fake_list_page.dart';
import 'package:tests_example/repositories/list_repository.dart';

class DependenciesIntroPage extends StatefulWidget {
  const DependenciesIntroPage({Key? key}) : super(key: key);

  @override
  State<DependenciesIntroPage> createState() => _DependenciesIntroPageState();
}

class _DependenciesIntroPageState extends State<DependenciesIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependency Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              label: 'Fake List - Cubit',
              nextWidget: BlocProvider(
                create: (context) => ListCubit(
                  listRepository: ListRepository(),
                ),
                child: const CubitFakeListPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
