
import '../repository/movie_repository.dart';

class RemoveFromFavoriteUseCase {
  final MoviesRepository moviesRepository;

  RemoveFromFavoriteUseCase(this.moviesRepository);

  Future<void> removeFromFavorite(int id) {
    return moviesRepository.removeFromFavorites(id);
  }
}