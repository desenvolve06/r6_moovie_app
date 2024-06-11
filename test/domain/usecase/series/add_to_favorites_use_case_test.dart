import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';

import '../../../stubs/stub.dart';
import '../../../utils/class_mock.dart';

void main() {
  late AddToFavoritesSeriesUseCase addToFavoritesSeriesUseCase;
  late SeriesRepository seriesRepository;

  final series = seriesMock;

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
