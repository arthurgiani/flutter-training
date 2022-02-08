import 'package:class_widgets/components/custom_button.dart';
import 'package:class_widgets/pages/navigation/navigation_test_first_page.dart';
import 'package:class_widgets/pages/widgets/widgets_intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Monument-Extended'),
        ),
      ),
      home: const MyHomePage(),
      //initialRoute: '/',
      //routes: {
      //  '/': (context) => const MyHomePage(),
      //  '/navigation-page1': (context) => const NavigationTestFirstPage(),
      //  '/navigation-page2': (context) => const NavigationTestSecondPage(),
      //  '/navigation-page3': (context) => const NavigationTestThirdPage()
      //},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHelloWorld = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Widgets',
              nextWidget: WidgetsIntroPage(),
            ),
            CustomButton(
              label: 'Navigation',
              nextWidget: NavigationTestFirstPage(),
            )
          ],
        ),
      ),
    );
  }
}
