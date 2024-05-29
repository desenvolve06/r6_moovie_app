
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';


class RemoveFromFavoriteSeriesUseCase {
  final SeriesRepository seriesRepository;

  RemoveFromFavoriteSeriesUseCase(this.seriesRepository);

  Future<void> removeFromFavorite(Series series) {
    return seriesRepository.removeFromFavorites(series);
  }
}