import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';

import '../../../stubs/stub.dart';
import '../../../utils/class_mock.dart';

void main() {
  late RemoveFromFavoriteSeriesUseCase removeFromFavoriteSeriesUseCase;
  late SeriesRepository seriesRepository;

  final series = seriesMock;

  setUpAll(() {
    seriesRepository = SeriesRepositoryMock();
    removeFromFavoriteSeriesUseCase =
        RemoveFromFavoriteSeriesUseCase(seriesRepository);
  });
  group('RemoveFromFavoritesUseCase', () {
    test('Should remove a serie from favorites', () async {
      when(() => seriesRepository.removeFromFavorites(series))
          .thenAnswer((_) => Future.value());

      await removeFromFavoriteSeriesUseCase.removeFromFavorite(series);

      verify(() => seriesRepository.removeFromFavorites(series)).called(1);
    });
  });
}
