import '../../data/models/movies_model.dart';

abstract class MoviesRepository {
  Future<List<MoviesModels>> getPopularMovies();
}
