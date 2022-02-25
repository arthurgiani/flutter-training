import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/external/adapter/profile_entity_adapter.dart';

void main() {
  group('fromMap', () {
    test('should return ProfileEntity when map fields are not null', () {
      //Arrange
      final Map<String, dynamic> map = {
        'login': 'teste',
        'id': '123455',
        'avatar_url': '12234422'
      };

      //Act
      final result = ProfileEntityAdapter.fromMap(map: map);

      //Assert
      expect(result, isA<ProfileEntity>());
      expect(result.id, '123455');
      expect(result.login, 'teste');
      expect(result.avatarUrl, '12234422');
    });
  });
}
