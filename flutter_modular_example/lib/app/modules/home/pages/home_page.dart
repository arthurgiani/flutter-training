import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/components/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Go to second page of HomeModule',
              onPressed: () {
                Modular.to.pushNamed('/second-page');
              },
            ),
            CustomButton(
              label: 'Go to CounterModule',
              onPressed: () {
                Modular.to.pushNamed('/counter/');
              },
            ),
            CustomButton(
              label: 'Go to CounterModule and dispose previous modules',
              onPressed: () {
                Modular.to.navigate('/counter/');
              },
            ),
            CustomButton(
              label: 'Go to Nested Module',
              onPressed: () {
                Modular.to.navigate('/nested/module-a/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
