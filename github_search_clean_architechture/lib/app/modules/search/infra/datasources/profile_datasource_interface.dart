import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';

abstract class IProfileDatasource {
  Future<List<ProfileEntity>> getProfiles({required String searchText});
}
