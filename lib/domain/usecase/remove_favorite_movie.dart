import 'dart:js_interop';

import '../repository/movie_repository.dart';

class RemoveFavoriteMovie {
  final MoviesRepository moviesRepository;

  RemoveFavoriteMovie(this.moviesRepository);

  Future<void> removeFavoriteMovie(int id) {
    return moviesRepository.removeFromFavourite(id);
  }
}