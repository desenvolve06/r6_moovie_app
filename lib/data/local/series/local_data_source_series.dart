import 'package:r6_moovie_app/domain/entities/series.dart';


abstract class LocalDataSourceSeries {

      Future<List<Series>> getFavorites();

      Future<void> addToFavorites(Series series);

      Future<bool> isFavorite(int id);

      Future<void> removeFromFavorites(Series series);
 }
