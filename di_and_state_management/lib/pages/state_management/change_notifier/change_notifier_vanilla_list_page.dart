import 'package:di_and_state_management/notifiers/list_change_notifier.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:flutter/material.dart';

class ChangeNotifierVanillaListPage extends StatefulWidget {
  const ChangeNotifierVanillaListPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierVanillaListPageState createState() =>
      _ChangeNotifierVanillaListPageState();
}

class _ChangeNotifierVanillaListPageState
    extends State<ChangeNotifierVanillaListPage> {
  final listChangeNotifier = ListChangeNotifier(
    listRepository: ListRepository(),
  );

  @override
  void initState() {
    super.initState();
    listChangeNotifier.getStringList();
  }

  @override
  void dispose() {
    listChangeNotifier.dispose();
    super.dispose();
  }

  /// [AnimatedBuilder] accepts a [ChangeNotifier] in [animation] parameter
  /// because both [ChangeNotifier] and [Animation] extends from [Listenable].

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vanilla Change Notifier')),
      body: AnimatedBuilder(
        animation: listChangeNotifier,
        builder: (_, __) {
          return _BodyWidget(listChangeNotifier: listChangeNotifier);
        },
      ),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  final ListChangeNotifier listChangeNotifier;
  const _BodyWidget({
    Key? key,
    required this.listChangeNotifier,
  }) : super(key: key);

  @override
  __BodyWidgetState createState() => __BodyWidgetState();
}

class __BodyWidgetState extends State<_BodyWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.listChangeNotifier.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (widget.listChangeNotifier.isListLoaded) {
      return ListView.builder(
        itemCount: widget.listChangeNotifier.stringList.length,
        itemBuilder: (context, index) {
          final text = widget.listChangeNotifier.stringList[index];
          return ListTile(
            title: Text(text),
          );
        },
      );
    }
    return const Center(
      child: Text('Error!'),
    );
  }
}
