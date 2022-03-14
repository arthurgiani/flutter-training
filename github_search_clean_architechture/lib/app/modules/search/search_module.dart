import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/repositories/profile_repository_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/domain/usecases/get_profiles.dart';
import 'package:github_search_clean_architechture/app/modules/search/external/datasources/profiles_datasource.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/datasources/profile_datasource_interface.dart';
import 'package:github_search_clean_architechture/app/modules/search/infra/repositories/profile_repository.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/cubit/profile_cubit.dart';
import 'package:github_search_clean_architechture/app/modules/search/presentation/pages/profiles_page.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        //datasource
        Bind.lazySingleton<IProfileDatasource>(
          (i) => ProfileDatasource(
            dio: i.get(),
          ),
        ),

        //repository
        Bind.lazySingleton<IProfileRepository>(
          (i) => ProfileRepository(
            profileDatasource: i.get(),
          ),
        ),

        //usecase
        Bind.factory<IGetProfilesUsecase>(
          (i) => GetProfilesUsecase(
            profileRepository: i.get(),
          ),
        ),

        //cubit
        Bind.factory(
          (i) => ProfileCubit(
            getProfilesUsecase: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ProfilesPage(
            profileCubit: Modular.get<ProfileCubit>(),
          ),
        ),
      ];
}
