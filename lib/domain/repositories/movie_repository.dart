import '../entities/movies.dart';

abstract class MoviesRepository {
  Future<List<Movies>> getPopularMovies();
}
