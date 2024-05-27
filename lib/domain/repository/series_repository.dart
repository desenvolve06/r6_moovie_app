import '../entities/series.dart';

abstract class SeriesRepository {
  Future<List<Series>> getPopularSeries();

  Future<List<int>> getFavourites();

  Future<void> addToFavorites(int id);

  Future<bool> isFavourite(int id);

  Future<void> removeFromFavorites(int id);

}



