import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/movies/local_data_source_movies.dart';
import 'package:r6_moovie_app/data/network/source/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/network/source/remote/movie_data_source.dart';
import 'package:r6_moovie_app/data/network/source/remote/series_data_source.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

class MockSeriesDatasource extends Mock implements SeriesDatasource {}

class MockLocalDataSourceSeries extends Mock implements LocalDataSourceSeries {}

class MockMovieDataSource extends Mock implements MovieDataSource {}

class MockLocalDataSourceMovies extends Mock implements LocalDataSourceMovies {}

class SeriesRepositoryMock extends Mock implements SeriesRepository {}