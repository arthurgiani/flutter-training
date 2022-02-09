import 'package:class_widgets/pages/navigation/navigation_test_third_page.dart';
import 'package:flutter/material.dart';

class NavigationTestSecondPage extends StatelessWidget {
  const NavigationTestSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: const Text('Go back to first page of the stack'),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              ElevatedButton(
                child: const Text('Go back to Page3'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NavigationTestThirdPage(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text(
                    'Go to Page3 and clear all stack until first route'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const NavigationTestThirdPage(),
                    ),
                    (route) => route.isFirst,
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Go to Page3 and clear all stack'),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const NavigationTestThirdPage(),
                    ),
                    (route) => false,
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Back to previous page'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
