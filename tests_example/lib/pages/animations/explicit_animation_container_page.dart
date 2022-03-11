import 'package:flutter/material.dart';

class ExplicitAnimationContainerPage extends StatefulWidget {
  const ExplicitAnimationContainerPage({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationContainerPageState createState() =>
      _ExplicitAnimationContainerPageState();
}

class _ExplicitAnimationContainerPageState
    extends State<ExplicitAnimationContainerPage>
    with SingleTickerProviderStateMixin {
  double padding = 10;
  late final AnimationController animation;
  late final Animation paddingAnimation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    paddingAnimation =
        Tween<double>(begin: padding, end: padding + 10).animate(animation);
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return Container(
              padding: EdgeInsets.all(paddingAnimation.value),
              width: 200,
              height: 500,
              color: Colors.green,
              child: Container(color: Colors.red),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animation.status == AnimationStatus.completed) {
            animation.reverse();
            return;
          }
          animation.forward();
        },
        child: const Text("Press"),
      ),
    );
  }
}
