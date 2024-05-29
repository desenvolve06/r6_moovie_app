
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';



class GetFavoritesSeriesUseCase {
  final SeriesRepository seriesRepository;

  GetFavoritesSeriesUseCase(this.seriesRepository);

  Future<List<Series>> getFavorites() {
    return seriesRepository.getFavorites();
  }
}