import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();

  // List<int> getFavoritesMovies();
  //
  // Future<void> removeFromFavourite(int id);
  //
  // bool checkIsFavoriteMovie(int id);
  // Future<bool> saveToFavourites(int id);
}
