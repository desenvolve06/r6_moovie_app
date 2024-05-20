import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();
}
