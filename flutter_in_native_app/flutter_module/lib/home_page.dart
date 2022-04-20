import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static const MethodChannel methodChannel = MethodChannel('native.app/test');
  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler((call) async {
      Navigator.of(context).pushNamed(call.arguments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Flutter Module',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Exit flutter app and return to native app.
          methodChannel.invokeMethod('exitModule');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
