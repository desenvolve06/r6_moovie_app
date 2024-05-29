import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class AddToFavoritesSeriesUseCase {
  final SeriesRepository seriesRepository;

  AddToFavoritesSeriesUseCase(this.seriesRepository);

  Future<void> addToFavoritesList(Series series) {
    return seriesRepository.addToFavorites(series);
  }
}