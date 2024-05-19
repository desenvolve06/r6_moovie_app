import '../entities/movies.dart';
import '../repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MoviesRepository repository;

  GetPopularMoviesUseCase(this.repository);

  Future<List<Movies>> invoke() => repository.getPopularMovies();
}
