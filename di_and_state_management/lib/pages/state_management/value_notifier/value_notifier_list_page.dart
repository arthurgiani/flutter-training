import 'package:di_and_state_management/notifiers/list_value_notifier.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';
import 'package:flutter/material.dart';

class ValueNotifierListPage extends StatefulWidget {
  const ValueNotifierListPage({Key? key}) : super(key: key);

  @override
  _ValueNotifierListPageState createState() => _ValueNotifierListPageState();
}

class _ValueNotifierListPageState extends State<ValueNotifierListPage> {
  final listValueNotifier = ListValueNotifier(listRepository: ListRepository());

  @override
  void initState() {
    super.initState();
    listValueNotifier.getStringList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: listValueNotifier,
        builder: (context, value, _) {
          if (value is ListLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (value is ListSuccess) {
            return ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                final text = value.list[index];
                return ListTile(
                  title: Text(text),
                );
              },
            );
          }
          if (value is ListError) {
            return Center(child: Text(value.errorMessage));
          }
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
