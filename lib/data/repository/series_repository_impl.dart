import '../../domain/entities/series.dart';
import '../../domain/repository/series_repository.dart';
import '../local/local_data_source.dart';
import '../source/series_data_source.dart';

class SeriesRepositoryImpl implements SeriesRepository {

  final SeriesDatasource seriesDatasource;
  final LocalDataSource localDataSource;

  SeriesRepositoryImpl(this.seriesDatasource, this.localDataSource);

  @override
  Future<List<Series>> getPopularSeries() => seriesDatasource.getPopularMSeries();

  @override
  Future<void> addToFavorites(int id) async {
  await localDataSource.addToFavorites(id);
  }

  @override
  Future<List<int>> getFavourites() async {
   return await localDataSource.getFavourites();
  }

  @override
  Future<bool> isFavourite(int id) async {
    return await localDataSource.isFavourite(id);
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    localDataSource.removeFromFavorites(id);
  }

}
