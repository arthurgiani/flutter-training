import 'package:di_and_state_management/models/text_a.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProviderPage extends StatefulWidget {
  const SingleProviderPage({Key? key}) : super(key: key);

  @override
  _SingleProviderPageState createState() => _SingleProviderPageState();
}

class _SingleProviderPageState extends State<SingleProviderPage> {
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
                //You can use context.read extension as well.
                //child: Text(context.read<TextA>().text),
                child: Text(Provider.of<FirstText>(context).text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
