import '../../../../../domain/entities/movie.dart';

abstract class LocalDataSource {

  Future<List<Movie>> getFavorites();

  Future<void> addToFavorites(Movie movie);

  Future<bool> isFavorite(int id);

  Future<void> removeFromFavorites(Movie movie);
}

