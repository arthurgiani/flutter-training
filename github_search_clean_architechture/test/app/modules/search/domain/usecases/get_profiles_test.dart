import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/repositories/profile_repository_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/usecases/get_profiles.dart';
import 'package:mocktail/mocktail.dart';

class ProfileRepositoryMock extends Mock implements IProfileRepository {}

void main() {
  late IProfileRepository profileRepository;
  late GetProfilesUsecase getProfilesUsecase;

  setUp(() {
    profileRepository = ProfileRepositoryMock();
    getProfilesUsecase =
        GetProfilesUsecase(profileRepository: profileRepository);
  });

  group('getProfilesUsecase', () {
    test(
        'should return List<ProfileEntity> when call to repository is sucessfull and when searchText.lenght >= 3',
        () async {
      //Arrange
      const String searchText = 'qualquer coisa maior que 3 caracteres';
      when(() => profileRepository.getProfiles(searchText: searchText))
          .thenAnswer((_) async => <ProfileEntity>[]);

      //Act
      final result = await getProfilesUsecase.call(searchText: searchText);

      //Assert
      expect(result, isA<List<ProfileEntity>>());
      verify(() => profileRepository.getProfiles(searchText: searchText))
          .called(1);
      verifyNoMoreInteractions(profileRepository);
    });
  });
}
