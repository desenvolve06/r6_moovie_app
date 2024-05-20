import '../../domain/entities/series.dart';

abstract class SeriesDatasource {
  Future<List<Series>> getPopularMSeries();
}
