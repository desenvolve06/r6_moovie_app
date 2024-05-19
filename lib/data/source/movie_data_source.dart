import '../../domain/entities/movies.dart';

abstract class MoviesDataSource {
  Future<List<Movies>> getPopularMovies();
}
