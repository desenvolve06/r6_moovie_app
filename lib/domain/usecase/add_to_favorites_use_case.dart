import '../repository/movie_repository.dart';

class AddToFavoritesUseCase {
  final MoviesRepository moviesRepository;

  AddToFavoritesUseCase(this.moviesRepository);

  Future<void> addToFavoritesList(int id) {
    return moviesRepository.addToFavorites(id);
  }
}