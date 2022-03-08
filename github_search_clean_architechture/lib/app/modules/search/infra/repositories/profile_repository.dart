import 'package:github_search_clean_architechture/app/core/exceptions.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/repositories/profile_repository_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/datasources/profile_datasource_interface.dart';

class ProfileRepository implements IProfileRepository {
  final IProfileDatasource _profileDatasource;

  ProfileRepository({
    required IProfileDatasource profileDatasource,
  }) : _profileDatasource = profileDatasource;

  @override
  Future<List<ProfileEntity>> getProfiles({required String searchText}) async {
    try {
      return await _profileDatasource.getProfiles(searchText: searchText);
    } on CustomException catch (error, stackTrace) {
      throw ProfileDatasourceFailure(
          message: error.message,
          stackTrace: stackTrace,
          label: 'ProfileRepository: getProfiles() - ProfileDatasourceFailure');
    } on TypeError catch (error, stackTrace) {
      throw ProfileParseFailure(
          message: 'Erro inesperado. Por favor tente novamente.',
          stackTrace: stackTrace,
          label: 'ProfileRepository: getProfiles() - ProfileParseFailure');
    } on FormatException catch (error, stackTrace) {
      throw ProfileParseFailure(
          message: 'Erro inesperado. Por favor tente novamente.',
          stackTrace: stackTrace,
          label: 'ProfileRepository: getProfiles() - ProfileParseFailure');
    } catch (error, stackTrace) {
      throw ProfileUnknownFailure(
          message: 'Erro inesperado. Por favor tente novamente.',
          stackTrace: stackTrace,
          label: 'ProfileRepository: getProfiles() - ProfileUnknownFailure');
    }
  }
}
