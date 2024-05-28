import 'dart:async';

import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class IsFavoriteUseCase {
  final MoviesRepository moviesRepository;

  IsFavoriteUseCase(this.moviesRepository);

  Future<bool> isFavorite(int id) {
    return moviesRepository.isFavorite(id);
  }
}
