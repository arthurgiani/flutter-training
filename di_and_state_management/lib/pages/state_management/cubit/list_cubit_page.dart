import 'package:di_and_state_management/blocs/list_cubit.dart';
import 'package:di_and_state_management/repositories/list_repository.dart';
import 'package:di_and_state_management/states/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubitPage extends StatefulWidget {
  const ListCubitPage({Key? key}) : super(key: key);

  @override
  _ListCubitPageState createState() => _ListCubitPageState();
}

class _ListCubitPageState extends State<ListCubitPage> {
  final listCubit = ListCubit(listRepository: ListRepository());

  @override
  void initState() {
    super.initState();
    listCubit.getStringList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        bloc: listCubit,
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
