import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();

  Future<List<int>> getFavourites();

  Future<void> addToFavorites(int id);

  Future<bool> isFavourite(int id);

  Future<void> removeFromFavorites(int id);

}
