import '../entities/series.dart';

abstract class SeriesRepository {
  Future<List<Series>> getPopularSeries();
}

