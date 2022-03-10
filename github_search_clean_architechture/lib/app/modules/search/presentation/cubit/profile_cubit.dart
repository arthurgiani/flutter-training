import 'package:bloc/bloc.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/usecases/get_profiles.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required IGetProfilesUsecase getProfilesUsecase,
  })  : _getProfilesUsecase = getProfilesUsecase,
        super(ProfileInitialState());

  final IGetProfilesUsecase _getProfilesUsecase;

  Future<void> getProfiles({required String searchText}) async {
    try {
      emit(ProfileLoadingState());
      final result = await _getProfilesUsecase.call(searchText: searchText);
      emit(ProfileLoadedState(profiles: result));
    } on ProfileFailure catch (error) {
      emit(ProfileErrorState(errorMessage: error.message));
    }
  }
}
