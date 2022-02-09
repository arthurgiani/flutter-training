import 'package:class_widgets/pages/navigation/navigation_test_second_page.dart';
import 'package:flutter/material.dart';

class NavigationTestThirdPage extends StatelessWidget {
  const NavigationTestThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
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
                  //canPop returns a boolean that indicates if you can pop
                  // this screen or not. It avoid to call pop when you're
                  //on last page of the app and therefore close the app because
                  //there will be no screens to show.
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
