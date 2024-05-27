import '../repository/series_repository.dart';

class AddSeriesToFavoritesUseCase {
  final SeriesRepository seriesRepository;

  AddSeriesToFavoritesUseCase(this.seriesRepository);

  Future<void> addToFavoritesList(int id) {
    return seriesRepository.addToFavorites(id);
  }
}