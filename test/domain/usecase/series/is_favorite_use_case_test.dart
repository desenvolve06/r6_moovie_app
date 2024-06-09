import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';

import '../../../utils/class_mock.dart';

void main() {
  late IsFavoriteSeriesUseCase isFavoriteSeriesUseCase;
  late SeriesRepository seriesRepository;
  setUpAll(() {
    seriesRepository = SeriesRepositoryMock();
    isFavoriteSeriesUseCase = IsFavoriteSeriesUseCase(seriesRepository);
  });

  group('IsFavoriteUseCase', () {
    test('Should return true if a serie is favorite', () async {
      when(() => seriesRepository.isFavorite(1)).thenAnswer((_) => Future.value(true));

      final result = await isFavoriteSeriesUseCase.isFavorite(1);

      expect(result, true);
    });
  });
}
