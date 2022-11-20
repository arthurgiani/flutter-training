import 'package:flutter/material.dart';

class StatefulWidgetLifecyclePage extends StatefulWidget {
  const StatefulWidgetLifecyclePage({Key? key}) : super(key: key);

  @override
  _StatefulWidgetLifecyclePageState createState() =>
      _StatefulWidgetLifecyclePageState();
}

class _StatefulWidgetLifecyclePageState
    extends State<StatefulWidgetLifecyclePage> {
  bool isSelected = false;
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
                //setState triggers didUpdateWidgets for StatefulWidgets that
                //belongs to this widget tree
                setState(() {
                  debugPrint('setState');
                  isSelected = !isSelected;
                });
              },
            ),
            const SizedBox(height: 20),
            const TextField(),
            const SizedBox(height: 20),
            isSelected == false ? const CounterContainer() : const Text('oi'),
          ],
        ),
      ),
    );
  }
}

class ExampleTextWidget extends StatefulWidget {
  // removed const clause in order to make DidUpdateWidget work, otherwise
  // there won't be any widget update because it's constant.
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
  Color? color;
  @override
  void initState() {
    super.initState();
    debugPrint('InitState');
    //chamada de API
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
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Text(
          'Height: ${mediaQuery.size.height}',
          style: const TextStyle(fontSize: 30),
        ),
        Text(
          'Bottom Padding: ${mediaQuery.viewPadding.bottom}',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class CounterContainer extends StatefulWidget {
  const CounterContainer({super.key});

  @override
  State<CounterContainer> createState() => _CounterContainerState();
}

class _CounterContainerState extends State<CounterContainer> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          count = count * 2;
        });
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Center(child: Text(count.toString())),
      ),
    );
  }
}
