
import '../../entities/movie.dart';
import '../../repository/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MoviesRepository repository;

  GetPopularMoviesUseCase(this.repository);

  Future<List<Movie>> invoke() => repository.getPopularMovies();
}