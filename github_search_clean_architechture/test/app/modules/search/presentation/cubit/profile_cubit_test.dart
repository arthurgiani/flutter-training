import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/entities/profile_entity.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/errors/failures.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/usecases/get_profiles.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/events.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/profile_cubit.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/states.dart';
import 'package:mocktail/mocktail.dart';

class GetProfilesUsecaseMock extends Mock implements IGetProfilesUsecase {}

void main() {
  late IGetProfilesUsecase getProfilesUsecaseMock;
  late ProfileCubit profileCubit;

  setUp(() {
    getProfilesUsecaseMock = GetProfilesUsecaseMock();
    profileCubit = ProfileCubit(getProfilesUsecase: getProfilesUsecaseMock);
  });

  group('getProfiles - no blocTest', () {
    test(
      'should emit [ProfileLoadingState, ProfileLoadedState] when usecase returns a non empty list',
      () async {
        //Arrange
        const String searchText = 'anything';
        when(() => getProfilesUsecaseMock.call(searchText: searchText))
            .thenAnswer(
          (_) async => <ProfileEntity>[
            const ProfileEntity(id: 'test', login: 'test', avatarUrl: 'test')
          ],
        );

        //Assert
        expectLater(
          profileCubit.stream,
          emitsInOrder(
            [
              isA<ProfileLoadingState>(),
              isA<ProfileLoadedState>(),
            ],
          ),
        );

        //Act
        profileCubit.add(GetProfilesEvent(searchText: searchText));
      },
    );

    test(
      'should emit [ProfileLoadingState, ProfileLoadedState] when usecase returns an empty list',
      () async {
        //Arrange
        const String searchText = 'anything';
        when(() => getProfilesUsecaseMock.call(searchText: searchText))
            .thenAnswer(
          (_) async => <ProfileEntity>[],
        );

        //Assert
        expectLater(
          profileCubit.stream,
          emitsInOrder(
            [
              isA<ProfileLoadingState>(),
              isA<ProfileEmptyState>(),
            ],
          ),
        );

        //Act
        profileCubit.add(GetProfilesEvent(searchText: searchText));
      },
    );

    test(
      'should emit [ProfileErrorState] when searchText with no whitespaces has lenght < 3',
      () async {
        //Arrange
        const String searchText = '12';

        //Assert
        expectLater(
          profileCubit.stream,
          emitsInOrder(
            [
              isA<ProfileErrorState>(),
            ],
          ),
        );

        //Act
        profileCubit.add(GetProfilesEvent(searchText: searchText));
      },
    );

    test(
      'should emit [ProfileLoadingState, ProfileErrorState] when usecase throws a subclass of ProfileFailure',
      () async {
        //Arrange
        const String searchText = 'anything';
        when(() => getProfilesUsecaseMock.call(searchText: searchText))
            .thenThrow(ProfileDatasourceFailure(message: ''));

        //Assert
        expectLater(
          profileCubit.stream,
          emitsInOrder(
            [
              isA<ProfileLoadingState>(),
              isA<ProfileErrorState>(),
            ],
          ),
        );

        //Act
        profileCubit.add(GetProfilesEvent(searchText: searchText));
      },
    );
  });

  group('getProfiles - blocTest', () {
    blocTest<ProfileCubit, ProfileState>(
      'should emit [ProfileLoadingState, ProfileLoadedState] when usecase returns a non empty list',
      build: () {
        when(() => getProfilesUsecaseMock.call(searchText: 'test')).thenAnswer(
          (_) async => <ProfileEntity>[
            const ProfileEntity(id: 'test', login: 'test', avatarUrl: 'test')
          ],
        );
        return profileCubit;
      },
      wait: const Duration(seconds: 1),
      act: (bloc) async =>
          profileCubit.add(GetProfilesEvent(searchText: 'test')),
      expect: () {
        return [
          isA<ProfileLoadingState>(),
          isA<ProfileLoadedState>(),
        ];
      },
      verify: (_) {
        verify(() => getProfilesUsecaseMock.call(searchText: 'test')).called(1);
        verifyNoMoreInteractions(getProfilesUsecaseMock);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'should emit [ProfileLoadingState, ProfileLoadedState] when usecase returns an empty list',
      build: () {
        when(() => getProfilesUsecaseMock.call(searchText: 'test')).thenAnswer(
          (_) async => <ProfileEntity>[],
        );
        return profileCubit;
      },
      wait: const Duration(seconds: 1),
      act: (bloc) async =>
          profileCubit.add(GetProfilesEvent(searchText: 'test')),
      expect: () {
        return [
          isA<ProfileLoadingState>(),
          isA<ProfileEmptyState>(),
        ];
      },
      verify: (_) {
        verify(() => getProfilesUsecaseMock.call(searchText: 'test')).called(1);
        verifyNoMoreInteractions(getProfilesUsecaseMock);
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'should emit [ProfileErrorState] when searchText with no whitespaces has lenght < 3',
      build: () {
        return profileCubit;
      },
      wait: const Duration(seconds: 1),
      act: (bloc) async => profileCubit.add(GetProfilesEvent(searchText: 'te')),
      expect: () {
        return [
          isA<ProfileErrorState>(),
        ];
      },
      verify: (_) {
        verifyNever(() => getProfilesUsecaseMock.call(searchText: 'test'));
      },
    );

    blocTest<ProfileCubit, ProfileState>(
      'should emit [ProfileLoadingState, ProfileErrorState] when usecase throws a subclass of ProfileFailure',
      build: () {
        when(() => getProfilesUsecaseMock.call(searchText: 'test'))
            .thenThrow(ProfileDatasourceFailure(message: ''));
        return profileCubit;
      },
      wait: const Duration(seconds: 1),
      act: (bloc) async =>
          profileCubit.add(GetProfilesEvent(searchText: 'test')),
      expect: () {
        return [
          isA<ProfileLoadingState>(),
          isA<ProfileErrorState>(),
        ];
      },
      verify: (_) {
        verify(() => getProfilesUsecaseMock.call(searchText: 'test')).called(1);
        verifyNoMoreInteractions(getProfilesUsecaseMock);
      },
    );
  });
}
