
import '../repository/series_repository.dart';

class RemoveSeriesFromFavoriteUseCase {
  final SeriesRepository seriesRepository;

  RemoveSeriesFromFavoriteUseCase(this.seriesRepository);

  Future<void> removeFromFavorite(int id) {
    return seriesRepository.removeFromFavorites(id);
  }
}