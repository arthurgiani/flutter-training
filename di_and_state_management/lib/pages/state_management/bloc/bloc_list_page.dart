import 'package:di_and_state_management/blocs/events/list_event.dart';
import 'package:di_and_state_management/blocs/list_bloc.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListPage extends StatefulWidget {
  const BlocListPage({Key? key}) : super(key: key);

  @override
  _BlocListPageState createState() => _BlocListPageState();
}

class _BlocListPageState extends State<BlocListPage> {
  final listBloc = ListBloc(listRepository: ListRepository());

  @override
  void initState() {
    super.initState();
    listBloc.add(GetListEvent());
  }

  @override
  void dispose() {
    listBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        bloc: listBloc,
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
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
