import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/network/api_client.dart';
import '../data/repository/movie_repository_impl.dart';
import '../data/service/movie_service_api.dart';
import '../data/service/series_service_api.dart';
import '../data/source/movie_data_source.dart';
import '../data/source/movie_data_source_impl.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/usecase/get_popular_movie_use_case.dart';
import '../data/repository/series_repository_impl.dart';
import '../data/source/series_data_source.dart';
import '../data/source/series_data_source_impl.dart';
import '../domain/repository/series_repository.dart';
import '../domain/usecase/get_popular_series_use_case.dart';
import '../presenter/bloc/movies/movie_bloc.dart';
import '../presenter/bloc/series/series_bloc.dart';

final getIt = GetIt.instance;

void setupMoviesDependencies() {
  getIt.registerSingleton<MovieServiceApi>(MovieServiceApi(getIt<Dio>()));

  getIt.registerSingleton<MovieDataSource>(
      MovieDataSourceImpl(getIt<MovieServiceApi>()));

  getIt.registerSingleton<MoviesRepository>(
      MoviesRepositoryImpl(getIt<MovieDataSource>()));

  getIt.registerSingleton<GetPopularMoviesUseCase>(
      GetPopularMoviesUseCase(getIt<MoviesRepository>()));

  getIt.registerFactory<MovieBloc>(
    () => MovieBloc(getIt<GetPopularMoviesUseCase>()),
  );
}

void setupSeriesDependencies() {
  getIt.registerSingleton<SeriesServiceApi>(SeriesServiceApi(getIt<Dio>()));

  getIt.registerSingleton<SeriesDatasource>(
      SeriesDataSourceImpl(getIt<SeriesServiceApi>()));

  getIt.registerSingleton<SeriesRepository>(
      SeriesRepositoryImpl(getIt<SeriesDatasource>()));

  getIt.registerSingleton<GetPopularSeriesUseCase>(
      GetPopularSeriesUseCase(getIt<SeriesRepository>()));

  getIt.registerFactory(() => SeriesBloc(getIt<GetPopularSeriesUseCase>()));
}

void setupDependencies() async {
  final dio = await ApiClient.getDio();
  getIt.registerSingleton<Dio>(dio);
  setupMoviesDependencies();
  setupSeriesDependencies();
}
