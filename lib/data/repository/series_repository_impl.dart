import '../../domain/entities/series.dart';
import '../../domain/repository/series_repository.dart';
import '../network/source/local/series/local_data_source_series.dart';
import '../network/source/remote/series_data_source.dart';

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
