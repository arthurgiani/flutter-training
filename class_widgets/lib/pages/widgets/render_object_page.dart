import 'package:flutter/material.dart';

class RenderObjectPage extends StatefulWidget {
  const RenderObjectPage({Key? key}) : super(key: key);

  @override
  _RenderObjectPageState createState() => _RenderObjectPageState();
}

class _RenderObjectPageState extends State<RenderObjectPage> {
  bool isHelloWorld = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Render Object'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Ao utilizar setState, o widget Text será reconstruído, porém
            //seu respectivo element e o renderObject associados serão apenas
            //atualizados (comparar hash do RenderObject no DevTools)
            Text(
              isHelloWorld ? 'Hello World' : 'Hello Flutter',
              style: const TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isHelloWorld = !isHelloWorld;
                });
              },
              child: const Text('Change text value'),
            )
          ],
        ),
      ),
    );
  }
}
