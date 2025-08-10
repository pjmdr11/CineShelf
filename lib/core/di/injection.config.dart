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
import '../../features/app/domain/usecases/set_locale.dart' as _i4;
import '../../features/auth/data/repository/user_repository_impl.dart' as _i979;
import '../../features/auth/domain/repository/user_repository.dart' as _i714;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/domain/usecases/session_use_case.dart' as _i828;
import '../../features/content_by_cast/data/repository/content_by_cast_repositoryimpl.dart'
    as _i622;
import '../../features/content_by_cast/domain/repository/content_by_cast_repository.dart'
    as _i773;
import '../../features/content_by_cast/domain/usecases/get_content_by_cast_usecase.dart'
    as _i264;
import '../../features/content_details/data/repository/content_detail_repositoryimpl.dart'
    as _i128;
import '../../features/content_details/domain/repository/content_detail_repository.dart'
    as _i364;
import '../../features/content_details/domain/use_cases/get_movie_detail.dart'
    as _i717;
import '../../features/content_details/domain/use_cases/get_tv_detail.dart'
    as _i551;
import '../../features/favourite_page/data/repository/favourite_repository_impl.dart'
    as _i755;
import '../../features/favourite_page/data/service/remote/favourite_data_store.dart'
    as _i1007;
import '../../features/favourite_page/domain/repository/favourites_repository.dart'
    as _i695;
import '../../features/favourite_page/domain/usecases/add_favourite.dart'
    as _i223;
import '../../features/favourite_page/domain/usecases/get_favourite.dart'
    as _i314;
import '../../features/favourite_page/domain/usecases/is_favourite.dart'
    as _i862;
import '../../features/favourite_page/domain/usecases/remove_favourite.dart'
    as _i7;
import '../../features/movie_home/data/repostories/movie_repository_impl.dart'
    as _i803;
import '../../features/movie_home/data/repostories/series_repository_impl.dart'
    as _i853;
import '../../features/movie_home/domain/repository/movie_repository.dart'
    as _i339;
import '../../features/movie_home/domain/repository/series_repository.dart'
    as _i116;
import '../../features/movie_home/domain/usecases/get_movie.dart' as _i992;
import '../../features/search/data/repository/search_repostoryimpl.dart'
    as _i558;
import '../../features/search/domain/respository/search_repository.dart'
    as _i364;
import '../../features/search/domain/usecase/search_cast_usecase.dart' as _i576;
import '../../features/search/domain/usecase/search_movie_usecase.dart'
    as _i523;
import '../../features/search/domain/usecase/search_tv_usecase.dart' as _i558;
import '../modules/app_module.dart' as _i781;
import '../modules/dio_module.dart' as _i948;
import '../utils/debouncer.dart' as _i599;
import '../utils/screen_utils.dart' as _i155;

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
    gh.lazySingleton<_i714.UserRepository>(() => _i979.UserRepositoryImpl());
    gh.factory<_i155.ScreenUtils>(() => _i155.ScreenUtils());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i1007.FavouriteDataSource>(
      () => _i1007.FavouriteDataSource(),
    );
    gh.lazySingleton<_i469.EnvHelper>(() => _i469.EnvHelper());
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i469.EnvHelper>()),
      registerFor: {_prod, _dev},
    );
    gh.factory<_i599.Debouncer>(() => _i599.Debouncer(milliseconds: gh<int>()));
    gh.lazySingleton<_i695.FavouriteRepository>(
      () => _i755.FavouriteRepositoryImpl(
        favouriteService: gh<_i1007.FavouriteDataSource>(),
        userRepostioryImpl: gh<_i714.UserRepository>(),
      ),
    );
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
    gh.singleton<_i603.AppRepository>(
      () => _i73.AppRepositoryImpl(
        preferenceHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i314.GetFavourteUseCase>(
      () => _i314.GetFavourteUseCase(
        favouriteRepository: gh<_i695.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i7.RemoveFavouriteUseCase>(
      () => _i7.RemoveFavouriteUseCase(
        favouriteRepository: gh<_i695.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i603.ApiService>(
      () => _i603.ApiService(
        dio: gh<_i361.Dio>(),
        envHelper: gh<_i469.EnvHelper>(),
      ),
    );
    gh.lazySingleton<_i116.SeriesRepository>(
      () => _i853.SeriesRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        prefHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i817.GetIsFirstOpen>(
      () => _i817.GetIsFirstOpen(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i202.GetAppThemeUseCase>(
      () => _i202.GetAppThemeUseCase(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i24.SetAppThemeUseCase>(
      () => _i24.SetAppThemeUseCase(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i4.SetLocaleUseCase>(
      () => _i4.SetLocaleUseCase(appRepo: gh<_i603.AppRepository>()),
    );
    gh.lazySingleton<_i223.AddFavouriteUseCase>(
      () => _i223.AddFavouriteUseCase(
        favouriteRepo: gh<_i695.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i862.IsFavouriteUseCase>(
      () => _i862.IsFavouriteUseCase(
        favouriteRepo: gh<_i695.FavouriteRepository>(),
      ),
    );
    gh.lazySingleton<_i773.ContentByCastRepository>(
      () => _i622.ContentByCastRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        prefHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i364.SearchRepository>(
      () => _i558.SearchRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        prefHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i339.MovieRepository>(
      () => _i803.MovieRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        envHelper: gh<_i469.EnvHelper>(),
        prefHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i364.ContentDetailsRepository>(
      () => _i128.ContentDetailRepositoryImpl(
        apiService: gh<_i603.ApiService>(),
        envHelper: gh<_i469.EnvHelper>(),
        prefHelper: gh<_i551.PreferenceHelper>(),
      ),
    );
    gh.lazySingleton<_i992.GetMovieContentUseCase>(
      () => _i992.GetMovieContentUseCase(
        movieRepo: gh<_i339.MovieRepository>(),
        seriesRepository: gh<_i116.SeriesRepository>(),
      ),
    );
    gh.lazySingleton<_i558.SearchTvUsecase>(
      () => _i558.SearchTvUsecase(gh<_i364.SearchRepository>()),
    );
    gh.lazySingleton<_i523.SearchMovieUseCase>(
      () => _i523.SearchMovieUseCase(gh<_i364.SearchRepository>()),
    );
    gh.lazySingleton<_i264.GetContentByCastUseCase>(
      () => _i264.GetContentByCastUseCase(
        contentByCastRepository: gh<_i773.ContentByCastRepository>(),
      ),
    );
    gh.lazySingleton<_i576.SearchCastUseCase>(
      () => _i576.SearchCastUseCase(gh<_i364.SearchRepository>()),
    );
    gh.lazySingleton<_i717.GetMovieDetailUsecase>(
      () => _i717.GetMovieDetailUsecase(
        contentDetailRepository: gh<_i364.ContentDetailsRepository>(),
      ),
    );
    gh.lazySingleton<_i551.GetTvDetailUseCase>(
      () => _i551.GetTvDetailUseCase(
        contentDetailRepository: gh<_i364.ContentDetailsRepository>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i781.AppModule {}

class _$DioModule extends _i948.DioModule {}
