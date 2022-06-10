import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
      if (call.method == 'navigate') {
        Navigator.of(context).pushNamed(call.arguments);
      }
    });
  }

  void forceCrashlyticsError() async {
    try {
      final value = int.parse('not a string');
    } catch (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
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
          children: <Widget>[
            const Text(
              'Flutter Module',
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: forceCrashlyticsError,
              child: const Text('Send Error to Crashlytics'),
            ),
            const ElevatedButton(
              onPressed: SystemNavigator.pop,
              child: Text('Exit Module'),
            )
          ],
        ),
      ),
    );
  }
}
