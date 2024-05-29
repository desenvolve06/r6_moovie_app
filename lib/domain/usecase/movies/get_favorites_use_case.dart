import 'package:r6_moovie_app/domain/repository/movie_repository.dart';

import '../../entities/movie.dart';

class GetFavoritesUseCase {
  final MoviesRepository moviesRepository;

  GetFavoritesUseCase(this.moviesRepository);

  Future<List<Movie>> getFavorites() {
    return moviesRepository.getFavorites();
  }
}