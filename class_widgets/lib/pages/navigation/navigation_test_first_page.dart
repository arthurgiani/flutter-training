import 'package:class_widgets/pages/navigation/navigation_test_second_page.dart';
import 'package:flutter/material.dart';

class NavigationTestFirstPage extends StatelessWidget {
  const NavigationTestFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
    );
  }
}
