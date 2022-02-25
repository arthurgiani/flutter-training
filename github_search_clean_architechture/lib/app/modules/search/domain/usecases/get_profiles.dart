import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/repositories/profile_repository_interface.dart';

abstract class IGetProfilesUsecase {
  Future<List<ProfileEntity>> call({required String searchText});
}

class GetProfilesUsecase implements IGetProfilesUsecase {
  final IProfileRepository _profileRepository;

  GetProfilesUsecase({
    required IProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  @override
  Future<List<ProfileEntity>> call({required String searchText}) async {
    final bool isShortString = searchText.replaceAll(' ', '').length < 3;
    if (isShortString) {
      throw ShortProfileNameFailure(
        message: 'Plase, type a name that has more than 3 characters.',
      );
    }
    return await _profileRepository.getProfiles(searchText: searchText);
  }
}
