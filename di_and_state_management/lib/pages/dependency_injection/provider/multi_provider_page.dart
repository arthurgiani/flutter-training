import 'package:di_and_state_management/models/text_a.dart';
import 'package:di_and_state_management/models/text_b.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderPage extends StatefulWidget {
  const MultiProviderPage({Key? key}) : super(key: key);

  @override
  _MultiProviderPageState createState() => _MultiProviderPageState();
}

class _MultiProviderPageState extends State<MultiProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Center(
                //child: Text(context.read<TextA>().text),
                child: Text(Provider.of<FirstText>(context).text),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Center(
                //child: Text(context.read<TextB>().text),
                child: Text(Provider.of<SecondText>(context).text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
