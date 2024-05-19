import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/api/movie_service_api.dart';
import '../data/network/api_client.dart';
import 'package:r6_moovie_app/data/repository/movie_repository_impl.dart';
import '../data/source/movie_data_source.dart';
import '../data/source/movie_data_source_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecase/get_popular_movies_usecase.dart';
import '../presentation/bloc/movies/movie_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  // API Client
  getIt.registerSingleton<Dio>(ApiClient.getDio());

  // API Service
  getIt.registerSingleton<MovieServiceApi>(MovieServiceApi(getIt<Dio>()));

  // DataSource
  getIt.registerSingleton<MoviesDataSource>(MovieDataSourceImpl(getIt<MovieServiceApi>()));

  // Repository
  getIt.registerSingleton<MoviesRepository>(MoviesRepositoryImpl(getIt<MoviesDataSource>()));

  // UseCase
  getIt.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(getIt<MoviesRepository>()));

  // Bloc
  getIt.registerFactory(() => MovieBloc(getIt<GetPopularMoviesUseCase>()));
}
