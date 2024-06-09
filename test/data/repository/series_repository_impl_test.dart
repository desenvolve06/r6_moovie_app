import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/network/source/remote/series_data_source.dart';
import 'package:r6_moovie_app/data/repository/series_repository_impl.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import '../../utils/class_mock.dart';

void main() {
  group('SeriesRepositoryImpl', () {
    late SeriesRepositoryImpl seriesRepository;
    late SeriesDatasource mockSeriesDatasource;
    late LocalDataSourceSeries mockLocalDataSourceSeries;

    final series = Series(
        id: 1,
        name: '',
        overview: '',
        firstAirDate: '',
        voteAverage: 2.5,
        posterPath: '',
        backdropPath: '');

    setUp(() {
      mockSeriesDatasource = MockSeriesDatasource();
      mockLocalDataSourceSeries = MockLocalDataSourceSeries();
      seriesRepository = SeriesRepositoryImpl(
        mockSeriesDatasource,
        mockLocalDataSourceSeries,
      );
    });

    test('getPopularSeries should return a list of Series', () async {
      
      when(() => mockSeriesDatasource.getPopularMSeries())
          .thenAnswer((_) async => Future.value([series]));

      
      final result = await seriesRepository.getPopularSeries();

      
      expect(result, [series]);
    });

    test('addToFavorites should call localDataSourceSeries.addToFavorites',
        () async {
      
      when(() => mockLocalDataSourceSeries.addToFavorites(series)).thenAnswer(
        (_) async => Future.value(),
      );

      
      await seriesRepository.addToFavorites(series);

      
      verify(() => mockLocalDataSourceSeries.addToFavorites(series)).called(1);
    });

    test('getFavorites should return a list of Series', () async {
      
      when(() => mockLocalDataSourceSeries.getFavorites())
          .thenAnswer((_) async => Future.value([series]));

      
      final result = await seriesRepository.getFavorites();

      
      expect(result, [series]);
    });

    test('isFavorite should return true if the series is in favorites',
        () async {
      

      when(() => mockLocalDataSourceSeries.isFavorite(series.id))
          .thenAnswer((_) async => true);

      
      final result = await seriesRepository.isFavorite(series.id);

      
      expect(result, isTrue);
    });

    test(
        'RemoveFromFavorites should call localDataSourceSeries.removeFromFavorites',
        () async {
      
      when(() => mockLocalDataSourceSeries.removeFromFavorites(series))
          .thenAnswer(
        (_) async => Future.value(),
      );

      
      await seriesRepository.removeFromFavorites(series);

      
      verify(() => mockLocalDataSourceSeries.removeFromFavorites(series))
          .called(1);
    });
  });
}