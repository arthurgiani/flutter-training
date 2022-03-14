import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/usecases/get_profiles.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/events.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/states.dart';
import 'package:rxdart/rxdart.dart';

class ProfileCubit extends Bloc<ProfileEvent, ProfileState> {
  ProfileCubit({
    required IGetProfilesUsecase getProfilesUsecase,
  })  : _getProfilesUsecase = getProfilesUsecase,
        super(ProfileInitialState()) {
    on<GetProfilesEvent>(
      (event, emit) => _getProfiles(event, emit),
      transformer: debounce(
        const Duration(seconds: 1),
      ),
    );
  }

  final IGetProfilesUsecase _getProfilesUsecase;

  Future<void> _getProfiles(
    GetProfilesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      if (event.searchText.replaceAll(" ", "").length < 3) {
        emit(
          const ProfileErrorState(
            errorMessage: 'Plase, type a name that has more than 3 characters.',
          ),
        );
        return;
      }
      emit(ProfileLoadingState());
      final result =
          await _getProfilesUsecase.call(searchText: event.searchText);
      if (result.isEmpty) {
        emit(ProfileEmptyState());
      } else {
        emit(ProfileLoadedState(profiles: result));
      }
    } on ProfileFailure catch (error) {
      emit(ProfileErrorState(errorMessage: error.message));
    }
  }

  EventTransformer<ProfileEvent> debounce<ProfileEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
