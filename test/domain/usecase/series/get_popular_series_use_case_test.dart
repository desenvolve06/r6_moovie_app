import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_popular_series_use_case.dart';

import '../../../utils/class_mock.dart';

void main() {
  late GetPopularSeriesUseCase getPopularSeriesUseCase;
  late SeriesRepository seriesRepository;

  final series = Series(
      id: 1,
      name: '',
      overview: '',
      firstAirDate: '',
      voteAverage: 2.5,
      posterPath: '',
      backdropPath: '');

  setUpAll(() {
    seriesRepository = SeriesRepositoryMock();
    getPopularSeriesUseCase = GetPopularSeriesUseCase(seriesRepository);
  });

  group('GetPopularSeriesUseCase', () {
    test('Should return a list of series', () async {
      when(() => seriesRepository.getPopularSeries())
          .thenAnswer((_) => Future.value([series]));
       
          
      final result = await getPopularSeriesUseCase.invoke();

      expect(result, [series]);
  });
  });
}
