import 'package:dio/dio.dart';
import 'package:github_search_clean_architechture/app/core/exceptions.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/external/adapter/profile_entity_adapter.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/datasources/profile_datasource_interface.dart';

class ProfileDatasource implements IProfileDatasource {
  final Dio _dio;

  ProfileDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProfileEntity>> getProfiles({required String searchText}) async {
    try {
      final Response response = await _dio.get(
        'https://api.github.com/search/users',
        queryParameters: {'q': searchText},
      );

      if (response.statusCode == 200) {
        final responseMapList =
            response.data['items'] as List<Map<String, dynamic>>;

        final profileList = responseMapList
            .map((map) => ProfileEntityAdapter.fromMap(map: map))
            .toList();

        return profileList;
      } else {
        throw DatasourceExpcetion(message: response.data['message'] ?? '');
      }
    } on DioError catch (error, stackTrace) {
      if (error.type == DioErrorType.connectTimeout) {
        throw NoInternetExpcetion(
          message: 'No Internet connection. Try Again',
          stackTrace: stackTrace,
        );
      } else {
        rethrow;
      }
    }
  }
}
