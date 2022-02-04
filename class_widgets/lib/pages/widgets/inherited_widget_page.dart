import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: Column(
        children: const [
          Container1(),
        ],
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  const Container1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: const Center(
        child: Container2(),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  const Container2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.red,
      child: const Center(
        child: Container3(),
      ),
    );
  }
}

class Container3 extends StatelessWidget {
  const Container3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.white,
    );
  }
}

class InheritedText extends InheritedWidget {
  const InheritedText({
    Key? key,
    required this.text,
    required Widget child,
  }) : super(key: key, child: child);

  final String text;

  static InheritedText of(BuildContext context) {
    final InheritedText? result =
        context.dependOnInheritedWidgetOfExactType<InheritedText>();
    assert(result != null, 'No InheritedText found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
