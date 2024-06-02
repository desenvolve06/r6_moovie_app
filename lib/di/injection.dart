import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/network/api_client.dart';
import '../data/network/source/local/movies/local_data_source.dart';
import '../data/network/source/local/movies/local_data_source_impl.dart';
import '../data/network/source/local/series/local_data_source_impl.dart';
import '../data/network/source/local/series/local_data_source_series.dart';
import '../data/network/source/remote/movie_data_source.dart';
import '../data/network/source/remote/movie_data_source_impl.dart';
import '../data/network/source/remote/series_data_source.dart';
import '../data/network/source/remote/series_data_source_impl.dart';
import '../data/repository/movie_repository_impl.dart';
import '../data/repository/series_repository_impl.dart';
import '../data/service/movie_service_api.dart';
import '../data/service/series_service_api.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/repository/series_repository.dart';
import '../domain/usecase/movies/add_to_favorites_use_case.dart';
import '../domain/usecase/movies/get_favorites_use_case.dart';
import '../domain/usecase/movies/get_popular_movie_use_case.dart';
import '../domain/usecase/movies/is_favorite_use_case.dart';
import '../domain/usecase/movies/remove_from_favorite_use_case.dart';
import '../domain/usecase/series/add_to_favorites_use_case.dart';
import '../domain/usecase/series/get_favorites_use_case.dart';
import '../domain/usecase/series/get_popular_series_use_case.dart';
import '../domain/usecase/series/is_favorite_use_case.dart';
import '../domain/usecase/series/remove_from_favorite_use_case.dart';
import '../presenter/bloc/favorites/favorite_bloc.dart';
import '../presenter/bloc/movies/movie_bloc.dart';
import '../presenter/bloc/series/series_bloc.dart';

final getIt = GetIt.instance;

void setupMoviesDependencies() {
  getIt.registerSingleton<MovieServiceApi>(MovieServiceApi(getIt<Dio>()));

  getIt.registerSingleton<MovieDataSource>(
      MovieDataSourceImpl(getIt<MovieServiceApi>()));

  getIt.registerSingleton<MoviesRepository>(
      MoviesRepositoryImpl(getIt<MovieDataSource>(), getIt<LocalDataSource>()));

  getIt.registerSingleton<GetPopularMoviesUseCase>(
      GetPopularMoviesUseCase(getIt<MoviesRepository>()));

  getIt.registerFactory<MovieBloc>(
      () => MovieBloc(getIt<GetPopularMoviesUseCase>()));
}

void setupFavoritesDependencies() {
  getIt.registerSingleton<GetFavoritesUseCase>(
      GetFavoritesUseCase(getIt<MoviesRepository>()));
  getIt.registerSingleton<IsFavoriteUseCase>(
      IsFavoriteUseCase(getIt<MoviesRepository>()));
  getIt.registerSingleton<AddToFavoritesUseCase>(
      AddToFavoritesUseCase(getIt<MoviesRepository>()));
  getIt.registerSingleton<RemoveFromFavoriteUseCase>(
      RemoveFromFavoriteUseCase(getIt<MoviesRepository>()));

  getIt.registerFactory<FavoriteBloc>(() => FavoriteBloc(
      getIt<AddToFavoritesUseCase>(),
      getIt<RemoveFromFavoriteUseCase>(),
      getIt<IsFavoriteUseCase>(),
      getIt<GetFavoritesUseCase>(),
      getIt<AddToFavoritesSeriesUseCase>(),
      getIt<RemoveFromFavoriteSeriesUseCase>(),
      getIt<IsFavoriteSeriesUseCase>(),
      getIt<GetFavoritesSeriesUseCase>()));
}

void setupSeriesDependencies() {
  getIt.registerSingleton<SeriesServiceApi>(SeriesServiceApi(getIt<Dio>()));

  getIt.registerSingleton<SeriesDatasource>(
      SeriesDataSourceImpl(getIt<SeriesServiceApi>()));

  getIt.registerSingleton<SeriesRepository>(SeriesRepositoryImpl(
      getIt<SeriesDatasource>(), getIt<LocalDataSourceSeries>()));

  getIt.registerSingleton<GetPopularSeriesUseCase>(
      GetPopularSeriesUseCase(getIt<SeriesRepository>()));

  getIt.registerFactory<SeriesBloc>(
      () => SeriesBloc(getIt<GetPopularSeriesUseCase>()));
}

void setupFavoritesSeriesDependencies() {
  getIt.registerSingleton<GetFavoritesSeriesUseCase>(
      GetFavoritesSeriesUseCase(getIt<SeriesRepository>()));
  getIt.registerSingleton<IsFavoriteSeriesUseCase>(
      IsFavoriteSeriesUseCase(getIt<SeriesRepository>()));
  getIt.registerSingleton<AddToFavoritesSeriesUseCase>(
      AddToFavoritesSeriesUseCase(getIt<SeriesRepository>()));
  getIt.registerSingleton<RemoveFromFavoriteSeriesUseCase>(
      RemoveFromFavoriteSeriesUseCase(getIt<SeriesRepository>()));
}

void setupDependencies() async {
  final dio = await ApiClient.getDio();
  getIt.registerSingleton<Dio>(dio);

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<LocalDataSource>(LocalDataSourceImpl());
  getIt.registerSingleton<LocalDataSourceSeries>(LocalDataSourceSeriesImpl());

  setupMoviesDependencies();
  setupSeriesDependencies();
  setupFavoritesDependencies();
  setupFavoritesSeriesDependencies();
}
