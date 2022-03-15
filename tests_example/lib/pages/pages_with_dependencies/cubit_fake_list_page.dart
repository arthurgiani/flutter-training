import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tests_example/blocs/list_cubit.dart';
import 'package:tests_example/blocs/list_state.dart';

class CubitFakeListPage extends StatefulWidget {
  const CubitFakeListPage({Key? key}) : super(key: key);

  @override
  _CubitFakeListPageState createState() => _CubitFakeListPageState();
}

class _CubitFakeListPageState extends State<CubitFakeListPage> {
  late final TextEditingController itemTextController;
  @override
  void initState() {
    context.read<ListCubit>().getStringList();
    itemTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake List - Cubit'),
      ),
      body: Column(
        children: [
          TextField(
            controller: itemTextController,
          ),
          BlocBuilder<ListCubit, ListState>(
            builder: (context, state) {
              if (state.status == ListStatus.loadingList) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state.status == ListStatus.loadedList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final text = state.items[index];
                      return ListTile(
                        title: Text(text),
                      );
                    },
                  ),
                );
              }
              if (state.status == ListStatus.error) {
                return Center(
                  child: Text(
                    state.error,
                    key: const Key('list-error-message'),
                  ),
                );
              }
              return const Center(child: Text('Error'));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<ListCubit>().addItem(item: itemTextController.text);
          itemTextController.clear();
        },
      ),
    );
  }
}
