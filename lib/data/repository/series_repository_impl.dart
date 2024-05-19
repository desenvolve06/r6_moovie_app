import 'package:r6_moovie_app/data/source/series_data_source.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import '../../domain/entities/series.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesDatasource seriesDatasource;
  SeriesRepositoryImpl(this.seriesDatasource);
  @override
  Future<List<Series>> getPopularSeries() => seriesDatasource.getPopularMSeries();
}
