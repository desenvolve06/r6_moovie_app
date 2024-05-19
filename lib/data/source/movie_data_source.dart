import '../../domain/entities/movie.dart';

abstract class MovieDataSource {
  Future<List<Movie>> getPopularMovies();
}