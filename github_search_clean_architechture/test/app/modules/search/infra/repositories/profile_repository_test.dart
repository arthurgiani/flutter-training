import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_clean_architechture/app/core/exceptions.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/repositories/profile_repository_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/datasources/profile_datasource_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/repositories/profile_repository.dart';
import 'package:mocktail/mocktail.dart';

class ProfileDatasourceMock extends Mock implements IProfileDatasource {}

void main() {
  late IProfileDatasource profileDatasource;
  late IProfileRepository profileRepository;

  setUp(() {
    profileDatasource = ProfileDatasourceMock();
    profileRepository = ProfileRepository(profileDatasource: profileDatasource);
  });

  group('getProfiles', () {
    test(
        'should return List<ProfileEntity> when call to datasource is sucessful',
        () async {
      //Arrange
      when(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).thenAnswer(
        (_) async => <ProfileEntity>[],
      );

      //Act
      final result = await profileRepository.getProfiles(searchText: 'text');

      //Assert
      expect(result, isA<List<ProfileEntity>>());
      verify(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).called(1);
      verifyNoMoreInteractions(profileDatasource);
    });

    test('should throw ProfileParseFailure when datasource throws a TypeError',
        () async {
      //Arrange
      when(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).thenThrow(TypeError());

      //Assert
      expect(() async => await profileRepository.getProfiles(searchText: ''),
          throwsA(isA<ProfileParseFailure>()));
      verify(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).called(1);
      verifyNoMoreInteractions(profileDatasource);
    });

    test(
        'should throw ProfileParseFailure when datasource throws a FormatException',
        () async {
      //Arrange
      when(() => profileDatasource.getProfiles(
              searchText: any(named: 'searchText')))
          .thenThrow(const FormatException());

      //Assert
      expect(() async => await profileRepository.getProfiles(searchText: ''),
          throwsA(isA<ProfileParseFailure>()));
      verify(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).called(1);
      verifyNoMoreInteractions(profileDatasource);
    });

    test(
        'should throw ProfileDatasourceFailure when datasource throws a subclass of CustomException',
        () async {
      //Arrange
      when(() => profileDatasource.getProfiles(
              searchText: any(named: 'searchText')))
          .thenThrow(DatasourceExpcetion(message: ''));

      //Assert
      expect(() async => await profileRepository.getProfiles(searchText: ''),
          throwsA(isA<ProfileDatasourceFailure>()));
      verify(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).called(1);
      verifyNoMoreInteractions(profileDatasource);
    });

    test(
        'should throw ProfileUnknownFailure when datasource throws a Expcetion',
        () async {
      //Arrange
      when(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).thenThrow(Exception());

      //Assert
      expect(() async => await profileRepository.getProfiles(searchText: ''),
          throwsA(isA<ProfileUnknownFailure>()));
      verify(() => profileDatasource.getProfiles(
          searchText: any(named: 'searchText'))).called(1);
      verifyNoMoreInteractions(profileDatasource);
    });
  });
}
