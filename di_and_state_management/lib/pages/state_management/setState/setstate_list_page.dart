import 'package:di_and_state_management/controllers/list_controller.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:flutter/material.dart';

class SetStateListPage extends StatefulWidget {
  const SetStateListPage({Key? key}) : super(key: key);

  @override
  _SetStateListPageState createState() => _SetStateListPageState();
}

class _SetStateListPageState extends State<SetStateListPage> {
  final _listController = ListController(listRepository: ListRepository());

  @override
  void initState() {
    super.initState();
    _listController.getStringList().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_listController.isLoading) {
      return const Material(child: CircularProgressIndicator.adaptive());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading List'),
        ),
        body: ListView.builder(
          itemCount: _listController.stringList.length,
          itemBuilder: (context, index) {
            final text = _listController.stringList[index];
            return ListTile(
              title: Text(text),
            );
          },
        ),
      );
    }
  }
}
