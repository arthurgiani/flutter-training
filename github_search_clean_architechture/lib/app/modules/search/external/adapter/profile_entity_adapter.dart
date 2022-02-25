import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';

class ProfileEntityAdapter {
  static ProfileEntity fromMap({required Map<String, dynamic> map}) {
    return ProfileEntity(
      id: map['id'],
      login: map['login'],
      avatarUrl: map['avatar_url'],
    );
  }
}
