import 'package:equatable/equatable.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState implements ProfileState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class ProfileLoadingState implements ProfileState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class ProfileLoadedState implements ProfileState {
  final List<ProfileEntity> profiles;

  const ProfileLoadedState({required this.profiles});

  @override
  List<Object?> get props => [profiles];

  @override
  bool? get stringify => true;
}

class ProfileErrorState implements ProfileState {
  final String errorMessage;

  const ProfileErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => true;
}

class ProfileEmptyState implements ProfileState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
