import 'package:flutter/material.dart';
import 'package:tests_example/components/custom_button.dart';
import 'package:tests_example/pages/animations/explicit_animation_container_page.dart';

class AnimationIntroPage extends StatefulWidget {
  const AnimationIntroPage({Key? key}) : super(key: key);

  @override
  State<AnimationIntroPage> createState() => _AnimationIntroPageState();
}

class _AnimationIntroPageState extends State<AnimationIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CustomButton(
              label: 'Explicit Animations - Container',
              nextWidget: ExplicitAnimationContainerPage(),
            ),
          ],
        ),
      ),
    );
  }
}
