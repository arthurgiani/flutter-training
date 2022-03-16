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
          BlocConsumer<ListCubit, ListState>(
            listener: (context, state) {
              if (state.status == ListStatus.addItemError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Type a valid name'),
                  ),
                );
              }
              if (state.status == ListStatus.loadedList) {
                itemTextController.clear();
              }
            },
            builder: (context, state) {
              if (state.status == ListStatus.loadingList) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state.status == ListStatus.getStringListerror) {
                return Center(
                  child: Text(
                    state.error,
                    key: const Key('list-error-message'),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  key: const Key('items-list-view-builder'),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final text = state.items[index];
                    return ListTile(
                      key: Key('item_$index'),
                      title: Text(text),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: BlocBuilder<ListCubit, ListState>(
          builder: (context, state) {
            if (state.status == ListStatus.addingItem) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return const Icon(Icons.add);
            }
          },
        ),
        onPressed: () {
          context.read<ListCubit>().addItem(item: itemTextController.text);
        },
      ),
    );
  }
}
