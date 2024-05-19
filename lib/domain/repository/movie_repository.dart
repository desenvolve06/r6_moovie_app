import '../../data/models/movies_model.dart';
import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();
}
