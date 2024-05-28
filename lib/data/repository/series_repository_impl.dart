import 'package:r6_moovie_app/data/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/source/series_data_source.dart';
import '../../domain/entities/series.dart';
import '../../domain/repository/series_repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesDatasource seriesDatasource;
  final LocalDataSourceSeries localDataSourceSeries;

  SeriesRepositoryImpl(this.seriesDatasource, this.localDataSourceSeries);
  @override
  Future<List<Series>> getPopularSeries() => seriesDatasource.getPopularMSeries();

  @override
  Future<void> addToFavorites(Series series) async {
  await localDataSourceSeries.addToFavorites(series);
  }

  @override
  Future<List<Series>> getFavorites() async {
   return await localDataSourceSeries.getFavorites();
  }

  @override
  Future<bool> isFavorite(int id) async {
    return await localDataSourceSeries.isFavorite(id);
  }

  @override
  Future<void> removeFromFavorites(Series series) async {
    localDataSourceSeries.removeFromFavorites(series);
  }
}
