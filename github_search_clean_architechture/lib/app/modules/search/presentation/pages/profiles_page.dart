import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/events.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/profile_cubit.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/states.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key, required this.profileCubit}) : super(key: key);
  final ProfileCubit profileCubit;

  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles Pages'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              widget.profileCubit.add(GetProfilesEvent(searchText: value));
            },
          ),
          const SizedBox(height: 32),
          BlocConsumer<ProfileCubit, ProfileState>(
            bloc: widget.profileCubit,
            listener: (context, state) {
              if (state is ProfileErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            listenWhen: (oldState, newState) {
              return oldState != newState;
            },
            builder: (context, state) {
              if (state is ProfileInitialState) {
                return const SizedBox.shrink();
              }
              if (state is ProfileLoadingState) {
                return const CircularProgressIndicator.adaptive();
              }
              if (state is ProfileEmptyState) {
                return const Text('No profiles founds.');
              }
              if (state is ProfileLoadedState) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemCount: state.profiles.length,
                    itemBuilder: (_, index) {
                      final profile = state.profiles[index];
                      return ListTile(
                        title: Text(profile.login),
                        subtitle: Text(profile.id),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            profile.avatarUrl,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
