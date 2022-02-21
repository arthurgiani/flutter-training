import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NestedPage extends StatefulWidget {
  const NestedPage({Key? key}) : super(key: key);

  @override
  _NestedPageState createState() => _NestedPageState();
}

/// You can also return a CustomBottomNavigationBar instead of a native
/// [BottomNavigationBar]. There's an example commented inside the build
/// method.

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
              label: 'Module A',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Modulo B',
            ),
          ],
        );
        // _CustomBottomNavigationBar();
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

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text(
              'ModuleA',
              textAlign: TextAlign.center,
            ),
            tileColor: Colors.red,
            onTap: () {
              Modular.to.navigate('../module-a/');
            },
            selectedTileColor: Colors.blue,
            selected: Modular.to.path.endsWith('/module-a/'),
            selectedColor: Colors.white,
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text(
              'ModuleB',
              textAlign: TextAlign.center,
            ),
            tileColor: Colors.red,
            onTap: () {
              Modular.to.navigate('../module-b/');
            },
            selectedTileColor: Colors.blue,
            selected: Modular.to.path.endsWith('/module-b/'),
            selectedColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
