import 'dart:async';

import 'package:r6_moovie_app/domain/repository/series_repository.dart';

class IsFavoriteSeriesUseCase {
  final SeriesRepository seriesRepository;

  IsFavoriteSeriesUseCase(this.seriesRepository);

  Future<bool> isFavorite(int id) {
    return seriesRepository.isFavorite(id);
  }
}
