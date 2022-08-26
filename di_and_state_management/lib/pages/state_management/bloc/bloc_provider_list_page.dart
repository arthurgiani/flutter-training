import 'package:di_and_state_management/blocs/list_bloc.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/events/list_event.dart';

class BlocProviderListPage extends StatefulWidget {
  const BlocProviderListPage({Key? key}) : super(key: key);

  @override
  _BlocProviderListPageState createState() => _BlocProviderListPageState();
}

class _BlocProviderListPageState extends State<BlocProviderListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ListBloc(listRepository: ListRepository())..add(GetListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loading List'),
        ),
        body: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is ListSuccess) {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final text = state.list[index];
                  return ListTile(
                    title: Text(text),
                  );
                },
              );
            }
            if (state is ListError) {
              return Center(child: Text(state.errorMessage));
            }
            return const Center(child: Text('Unexpected Error'));
          },
        ),
      ),
    );
  }
}
