import '../../entities/movie.dart';
import '../../repository/movie_repository.dart';

class AddToFavoritesUseCase {
  final MoviesRepository moviesRepository;

  AddToFavoritesUseCase(this.moviesRepository);

  Future<void> addToFavoritesList(Movie movie) {
    return moviesRepository.addToFavorites(movie);
  }
}