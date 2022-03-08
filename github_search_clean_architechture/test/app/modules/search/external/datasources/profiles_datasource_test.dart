import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_clean_architechture/app/core/exceptions.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/external/datasources/profiles_datasource.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/datasources/profile_datasource_interface.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/get_profiles_response_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dioMock;
  late IProfileDatasource profileDatasource;

  setUp(() {
    dioMock = DioMock();
    profileDatasource = ProfileDatasource(dio: dioMock);
  });

  group('getProfiles', () {
    test(
        'should return List<ProfileEntity> when call to http client returns a Response with status code = 200',
        () async {
      //Arrange
      const searchText = '12345670';
      when(() => dioMock.get('https://api.github.com/search/users',
          queryParameters: {'q': searchText})).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: getProfilesResponseMock,
          requestOptions:
              RequestOptions(path: 'https://api.github.com/search/users'),
        ),
      );

      //Act
      final result =
          await profileDatasource.getProfiles(searchText: searchText);

      //Assert
      expect(result, isA<List<ProfileEntity>>());
      verify(() => dioMock.get('https://api.github.com/search/users',
          queryParameters: {'q': searchText})).called(1);
      verifyNoMoreInteractions(dioMock);
    });

    test(
        'should throw DatasourceException when call to http service returns a Response with status code != 200',
        () {
      //Arrange
      const searchText = '12345670';
      when(() => dioMock.get('https://api.github.com/search/users',
          queryParameters: {'q': searchText})).thenAnswer(
        (_) async => Response(
          statusCode: 400,
          data: {'message': 'Name not found'},
          requestOptions:
              RequestOptions(path: 'https://api.github.com/search/users'),
        ),
      );

      //Assert
      expect(() => profileDatasource.getProfiles(searchText: searchText),
          throwsA(isA<DatasourceExpcetion>()));
    });

    test(
        'should throw NoInternetException when call to http service throws a DioError with type == DioErrorType.connectTimeout',
        () {
      //Arrange
      const searchText = '12345670';
      when(() => dioMock.get('https://api.github.com/search/users',
          queryParameters: {'q': searchText})).thenThrow(
        DioError(
          type: DioErrorType.connectTimeout,
          requestOptions: RequestOptions(
            path: 'https://api.github.com/search/users',
          ),
        ),
      );

      //Assert
      expect(() => profileDatasource.getProfiles(searchText: searchText),
          throwsA(isA<NoInternetExpcetion>()));
    });

    test(
        'should throw DioError when call to http service throws a DioError with type != DioErrorType.connectTimeout',
        () {
      //Arrange
      const searchText = '12345670';
      when(() => dioMock.get('https://api.github.com/search/users',
          queryParameters: {'q': searchText})).thenThrow(
        DioError(
          requestOptions: RequestOptions(
            path: 'https://api.github.com/search/users',
          ),
        ),
      );

      //Assert
      expect(() => profileDatasource.getProfiles(searchText: searchText),
          throwsA(isA<DioError>()));
    });
  });
}
