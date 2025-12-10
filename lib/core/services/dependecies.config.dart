// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/home/data/repository/book_repo.dart' as _i889;
import '../../features/home/data/repository/book_repo_imp.dart' as _i323;
import '../../features/home/presentation/controller/cubits/home_cubit.dart'
    as _i253;
import '../../features/search/data/repository/search_repo.dart' as _i822;
import '../../features/search/data/repository/search_repo_imp.dart' as _i936;
import '../../features/search/presentation/controller/search_cubit.dart'
    as _i1064;
import '../cubit/theme_cubit.dart' as _i319;
import '../network/network_checker.dart' as _i387;
import 'api_service.dart' as _i738;
import 'dependecies.dart' as _i1048;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i319.ThemeCubit>(() => _i319.ThemeCubit());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectionModule.connectionChecker,
    );
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio);
    gh.lazySingletonAsync<_i460.SharedPreferences>(() => injectionModule.prefs);
    gh.factory<_i738.ApiService>(() => _i738.ApiService(gh<_i361.Dio>()));
    gh.factory<_i889.BookRepo>(() => _i323.BookRepoImp(gh<_i738.ApiService>()));
    gh.factory<_i387.NetworkChecker>(
      () => _i387.NetworkCheckerImp(gh<_i973.InternetConnectionChecker>()),
    );
    gh.factory<_i822.SearchRepo>(
      () => _i936.SearchRepoImp(gh<_i738.ApiService>()),
    );
    gh.lazySingleton<_i1064.SearchCubit>(
      () => _i1064.SearchCubit(gh<_i822.SearchRepo>()),
    );
    gh.lazySingleton<_i253.HomeCubit>(
      () => _i253.HomeCubit(gh<_i889.BookRepo>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i1048.InjectionModule {}
