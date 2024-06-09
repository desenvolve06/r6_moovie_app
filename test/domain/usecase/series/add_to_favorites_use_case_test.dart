import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';

import '../../../utils/class_mock.dart';
import '../../../utils/stubs.dart';

void main() {
  late AddToFavoritesSeriesUseCase addToFavoritesSeriesUseCase;
  late SeriesRepository seriesRepository;

  setUpAll(() {
    seriesRepository = SeriesRepositoryMock();
    addToFavoritesSeriesUseCase = AddToFavoritesSeriesUseCase(seriesRepository);
  });

  group('addToFavoritesUseCaseSeries', () {
    test('Should add a serie in favorites', () async {
      when(() => seriesRepository.addToFavorites(series))
          .thenAnswer((_) => Future.value());

      await addToFavoritesSeriesUseCase.addToFavoritesList(series);

      verify(() => seriesRepository.addToFavorites(series)).called(1);
    });
  });
}
