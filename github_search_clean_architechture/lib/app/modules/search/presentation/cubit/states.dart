import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';

abstract class ProfileState {}

class ProfileInitialState implements ProfileState {}

class ProfileLoadingState implements ProfileState {}

class ProfileLoadedState implements ProfileState {
  final List<ProfileEntity> profiles;

  const ProfileLoadedState({required this.profiles});
}

class ProfileErrorState implements ProfileState {
  final String errorMessage;

  const ProfileErrorState({required this.errorMessage});
}
