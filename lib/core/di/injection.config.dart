// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/local/env_helper.dart' as _i469;
import '../../data/local/preference_helper.dart' as _i551;
import '../../data/remote/service/api_service.dart' as _i603;
import '../../features/app/data/repository/app_repository_impl.dart' as _i73;
import '../../features/app/domain/respository/app_repository.dart' as _i603;
import '../../features/app/domain/usecases/get_apptheme.dart' as _i202;
import '../../features/app/domain/usecases/get_isfirstopen.dart' as _i817;
import '../../features/app/domain/usecases/set_apptheme.dart' as _i24;
import '../../features/auth/data/repository/user_repository_impl.dart' as _i979;
import '../../features/auth/domain/repository/user_repository.dart' as _i714;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/domain/usecases/session_use_case.dart' as _i828;
import '../../features/content_details/data/repository/content_detail_repositoryimpl.dart'
    as _i128;
import '../../features/content_details/domain/repository/content_detail_repository.dart'
    as _i364;
import '../../features/content_details/domain/use_cases/get_movie_detail.dart'
    as _i717;
import '../../features/content_details/domain/use_cases/get_tv_detail.dart'
    as _i551;
import '../../features/favourite_content/data/repository/favourite_repository_impl.dart'
    as _i48;
import '../../features/favourite_content/data/service/remote/favourite_data_store.dart'
    as _i458;
import '../../features/favourite_content/domain/repository/favourites_repository.dart'
    as _i1006;
import '../../features/favourite_content/domain/usecases/add_favourite.dart'
    as _i508;
import '../../features/favourite_content/domain/usecases/get_favourite.dart'
    as _i98;
import '../../features/favourite_content/domain/usecases/is_favourite.dart'
    as _i33;
import '../../features/favourite_content/domain/usecases/remove_favourite.dart'
    as _i479;
import '../../features/movies/data/repostories/movie_repository_impl.dart'
    as _i613;
import '../../features/movies/data/repostories/series_repository_impl.dart'
    as _i639;
import '../../features/movies/domain/repository/movie_repository.dart' as _i974;
import '../../features/movies/domain/repository/series_repository.dart'
    as _i143;
import '../../features/movies/domain/usecases/get_moview.dart' as _i707;
import '../modules/app_module.dart' as _i781;
import '../modules/dio_module.dart' as _i948;
import '../utils/debouncer.dart' as _i599;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i469.EnvHelper>(() => _i469.EnvHelper());
    gh.lazySingleton<_i458.FavouriteDataSource>(
      () => _i458.FavouriteDataSource(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i469.EnvHelper>()),
      registerFor: {_prod, _dev},
    );
    gh.lazySingleton<_i714.UserRepository>(() => _i979.UserRepositoryImpl());
    gh.factory<_i599.Debouncer>(() => _i599.Debouncer(milliseconds: gh<int>()));
    gh.lazySingleton<_i551.PreferenceHelper>(
      () => _i551.PreferenceHelper(prefs: gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i828.GetSessionUseCase>(
      () => _i828.GetSessionUseCase(userRepo: gh<_i714.UserRepository>()),
    );
    gh.lazySingleton<_i97.RegisterUseCase>(
      () => _i97.RegisterUseCase(userRepo: gh<_i714.UserRepository>()),
    );
    gh.lazySingleton<_i37.LoginUseCase>(
      () => _i37.LoginUseCase(userRepo: gh<_i714.UserRepository>()),
    );
    gh.lazySingleton<_i1006.FavouriteRepository>(
      () => _i48.FavouriteRepositoryImpl(
        favouriteService: gh<_i458.FavouriteDataSource>(),
      ),
    );
    gh.lazySingleton<_i508.AddFavouriteUseCase>(
      () => _i508.AddFavouriteUseCase(
        favouriteRepo: gh<_i1006.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i33.IsFavouriteUseCase>(
      () => _i33.IsFavouriteUseCase(
        favouriteRepo: gh<_i1006.FavouriteRepository>(),
      ),
    );
    gh.singleton<_i603.AppRepository>(
      () => _i73.AppRepositoryImpl(
        preferenceHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i603.ApiService>(
      () => _i603.ApiService(
        dio: gh<_i361.Dio>(),
        envHelper: gh<_i469.EnvHelper>(),
      ),
    );
    gh.lazySingleton<_i817.GetIsFirstOpen>(
      () => _i817.GetIsFirstOpen(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i202.GetAppThemeUseCase>(
      () => _i202.GetAppThemeUseCase(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i24.SetAppTheme>(
      () => _i24.SetAppTheme(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i974.MovieRepository>(
      () => _i613.MovieRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        envHelper: gh<_i469.EnvHelper>(),
      ),
    );
    gh.lazySingleton<_i98.GetFavourteUseCase>(
      () => _i98.GetFavourteUseCase(
        favouriteRepository: gh<_i1006.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i479.RemoveFavouriteUseCase>(
      () => _i479.RemoveFavouriteUseCase(
        favouriteRepository: gh<_i1006.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i364.ContentDetailsRepository>(
      () => _i128.ContentDetailRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        envHelper: gh<_i469.EnvHelper>(),
      ),
    );
    gh.lazySingleton<_i143.SeriesRepository>(
      () => _i639.SeriesRepositoryImpl(apiService: gh<_i603.ApiService>()),
    );
    gh.lazySingleton<_i717.GetMovieDetailUsecase>(
      () => _i717.GetMovieDetailUsecase(
        contentDetailRepository: gh<_i364.ContentDetailsRepository>(),
      ),
    );
    gh.lazySingleton<_i551.GetTvDetailUseCase>(
      () => _i551.GetTvDetailUseCase(
        contentDetailRepo: gh<_i364.ContentDetailsRepository>(),
      ),
    );
    gh.lazySingleton<_i707.GetMovieContentUseCase>(
      () => _i707.GetMovieContentUseCase(
        movieRepo: gh<_i974.MovieRepository>(),
        seriesRepository: gh<_i143.SeriesRepository>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i781.AppModule {}

class _$DioModule extends _i948.DioModule {}
