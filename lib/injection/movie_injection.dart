import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/network/api_client.dart';
import '../data/repository/movie_repository_impl.dart';
import '../data/service/movie_service_api.dart';
import '../data/source/movie_data_source.dart';
import '../data/source/movie_data_source_impl.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/usecase/get_popular_movie_use_case.dart';
import '../presentation/bloc/movies/movie_bloc.dart';

final getIt = GetIt.instance;

void setupMoviesDependencies() {

  getIt.registerSingleton<Dio>(ApiClient.getDio());

  getIt.registerSingleton<MovieServiceApi>(MovieServiceApi(getIt<Dio>()));

  getIt.registerSingleton<MovieDataSource>(MovieDataSourceImpl(getIt<MovieServiceApi>()));

  getIt.registerSingleton<MoviesRepository>(MoviesRepositoryImpl(getIt<MovieDataSource>()));

  getIt.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(getIt<MoviesRepository>()));

  getIt.registerFactory(() => MovieBloc(getIt<GetPopularMoviesUseCase>()));
}
