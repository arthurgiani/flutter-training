import 'package:di_and_state_management/notifiers/list_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderListPage extends StatefulWidget {
  const ChangeNotifierProviderListPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierProviderListPageState createState() =>
      _ChangeNotifierProviderListPageState();
}

class _ChangeNotifierProviderListPageState
    extends State<ChangeNotifierProviderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  __BodyWidgetState createState() => __BodyWidgetState();
}

class __BodyWidgetState extends State<_BodyWidget> {
  @override
  Widget build(BuildContext context) {
    final listChangeNotifier = context.watch<ListChangeNotifier>();
    if (listChangeNotifier.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (listChangeNotifier.isListLoaded) {
      return ListView.builder(
        itemCount: listChangeNotifier.stringList.length,
        itemBuilder: (context, index) {
          final text = listChangeNotifier.stringList[index];
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
