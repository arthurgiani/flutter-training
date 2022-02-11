import 'package:di_and_state_management/controllers/list_controller.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:flutter/material.dart';

class SetStateListPage extends StatefulWidget {
  const SetStateListPage({Key? key}) : super(key: key);

  @override
  _SetStateListPageState createState() => _SetStateListPageState();
}

class _SetStateListPageState extends State<SetStateListPage> {
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
  final _listController = ListController(listRepository: ListRepository());

  /// [WidgetsBinding.instance!.addPostFrameCallback] is used to ensure
  /// that setState will be called after the build of the first frame.
  /// [setState] cannot be called while the widget tree is been built.
  @override
  void initState() {
    super.initState();
    _listController.getStringList().then((value) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {});
      });
    }).catchError((error, stackTrace) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_listController.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (_listController.isListLoaded) {
      return ListView.builder(
        itemCount: _listController.stringList.length,
        itemBuilder: (context, index) {
          final text = _listController.stringList[index];
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
