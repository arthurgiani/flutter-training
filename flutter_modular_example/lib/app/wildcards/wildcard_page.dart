import 'package:flutter/material.dart';

class WildcardPage extends StatefulWidget {
  const WildcardPage({Key? key}) : super(key: key);

  @override
  _WildcardPageState createState() => _WildcardPageState();
}

class _WildcardPageState extends State<WildcardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  }
}
