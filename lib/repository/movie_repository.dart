
import '../models/movies_model.dart';

abstract class MoviesRepository {
  Future<MoviesModels> getPopularMovies();
}