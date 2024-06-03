import '../../entities/movie.dart';
import '../../repository/movie_repository.dart';

class SaveMoviesUseCase {
  final MoviesRepository moviesRepository;

  SaveMoviesUseCase(this.moviesRepository);

  Future<void> invoke(List<Movie> movies) async {
    return moviesRepository.saveMovies(movies);
  }
}