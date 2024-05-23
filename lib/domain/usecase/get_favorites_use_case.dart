import 'package:r6_moovie_app/domain/repository/movie_repository.dart';

class GetFavoritesUseCase {
  final MoviesRepository moviesRepository;

  GetFavoritesUseCase(this.moviesRepository);

  Future<List<int>> getFavorites() {
    return moviesRepository.getFavourites();
  }
}