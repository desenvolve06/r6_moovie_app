import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

class SeriesRepositoryMock extends Mock implements SeriesRepository {}