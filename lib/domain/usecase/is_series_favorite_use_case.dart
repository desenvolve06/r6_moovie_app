import 'dart:async';

import '../repository/series_repository.dart';

class IsSeriesFavoriteUseCase {
  final SeriesRepository seriesRepository;

  IsSeriesFavoriteUseCase(this.seriesRepository);

  Future<bool> isFavorite(int id) {
    return seriesRepository.isFavourite(id);
  }
}
