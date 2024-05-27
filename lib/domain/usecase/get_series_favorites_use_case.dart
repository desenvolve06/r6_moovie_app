import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class GetSeriesFavoritesUseCase {
  final SeriesRepository seriesRepository;

  GetSeriesFavoritesUseCase(this.seriesRepository);

  Future<List<int>> getFavorites() {
    return seriesRepository.getFavourites();
  }
}