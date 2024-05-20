import '../entities/series.dart';
import '../repository/series_repository.dart';

class GetPopularSeriesUseCase {
  final SeriesRepository repository;

  GetPopularSeriesUseCase(this.repository);

  Future<List<Series>> invoke() => repository.getPopularSeries();
}