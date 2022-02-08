import 'package:flutter/material.dart';

import 'navigation_test_second_page.dart';

class NavigationTestFirstPage extends StatelessWidget {
  const NavigationTestFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Page2'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const NavigationTestSecondPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Back to Previous Page'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
