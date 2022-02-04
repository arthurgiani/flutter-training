import 'package:flutter/material.dart';

class StatefulWidgetLifecyclePage extends StatefulWidget {
  const StatefulWidgetLifecyclePage({Key? key}) : super(key: key);

  @override
  _StatefulWidgetLifecyclePageState createState() =>
      _StatefulWidgetLifecyclePageState();
}

class _StatefulWidgetLifecyclePageState
    extends State<StatefulWidgetLifecyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stful Lifecycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: ExampleTextWidget(),
              onTap: () {
                //setState dispara o método didUpdateWidget nos widgets que
                //são reconstruídos
                debugPrint('setState');
                setState(() {});
              },
            ),
            TextField()
          ],
        ),
      ),
    );
  }
}

class ExampleTextWidget extends StatefulWidget {
  // const removido para que o DidUpdateWidget funcione, caso
  // contrário não haverá atualização de widget pois o widget é constante
  // ignore: prefer_const_constructors_in_immutables
  ExampleTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ExampleTextWidget> createState() {
    debugPrint('CreateState');
    return _ExampleTextWidgetState();
  }
}

class _ExampleTextWidgetState extends State<ExampleTextWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint('InitState');
  }

  @override
  void didChangeDependencies() {
    debugPrint('DidChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ExampleTextWidget oldWidget) {
    debugPrint('Did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint('Deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('Dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).viewPadding.bottom.toString());
    debugPrint('Build');
    return const Text('Example text widget');
  }
}
