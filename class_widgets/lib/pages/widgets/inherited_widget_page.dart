import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  //if you don't use a InheritedWidget mechanism, you'll have to pass
  //the text variable throughout each constructor until it gets to the last
  //container
  final text = 'test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: Column(
        children: [
          Container1(
            text: text,
          ),
        ],
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  final String text;
  const Container1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Center(
        child: Container2(
          text: text,
        ),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  final String text;
  const Container2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.red,
      child: Center(
        child: Container3(
          text: text,
        ),
      ),
    );
  }
}

class Container3 extends StatelessWidget {
  final String text;
  const Container3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.white,
      child: Center(
        //child: Text(InheritedText.of(context).text)
        child: Text(text),
      ),
    );
  }
}

//wrap [MaterialApp] in main.dart inside a [InheritedText] and you can retrieve 'text'
//value in any component using InheritedText.of(context).text
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
