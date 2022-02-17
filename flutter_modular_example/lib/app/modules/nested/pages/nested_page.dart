import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NestedPage extends StatefulWidget {
  const NestedPage({Key? key}) : super(key: key);

  @override
  _NestedPageState createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: NavigationListener(builder: (context, child) {
        return BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.blue,
          currentIndex: _setCurrentIndex(),
          onTap: (index) {
            if (index == 0) {
              Modular.to.navigate('/nested/module-a/');
            }
            if (index == 1) {
              Modular.to.navigate('/nested/module-b/');
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Modulo Inicial',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'ModuloB',
            ),
          ],
        );
      }),
    );
  }

  int _setCurrentIndex() {
    if (Modular.to.path.endsWith('/module-a/')) {
      return 0;
    }
    if (Modular.to.path.endsWith('/module-b/')) {
      return 1;
    }
    return 0;
  }
}
