
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class RemoveFromFavoriteUseCase {
  final MoviesRepository moviesRepository;

  RemoveFromFavoriteUseCase(this.moviesRepository);

  Future<void> removeFromFavorite(Movie movie) {
    return moviesRepository.removeFromFavorites(movie);
  }
}