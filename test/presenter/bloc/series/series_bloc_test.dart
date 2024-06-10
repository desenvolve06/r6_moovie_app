import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_event.dart';
import 'package:r6_moovie_app/presenter/bloc/series/series_state.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_popular_series_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../../utils/class_mock.dart';
import '../mock_movies_and_series_list.dart';

void main() {
  late SeriesRepositoryMock seriesRepositoryMock;
  late GetPopularSeriesUseCase getPopularSeriesUseCase;
  late SeriesBloc seriesBloc;

  setUp(() {
    seriesRepositoryMock = SeriesRepositoryMock();
    getPopularSeriesUseCase = GetPopularSeriesUseCase(seriesRepositoryMock);
    seriesBloc = SeriesBloc(getPopularSeriesUseCase);
  });

  group('SeriesBloc', () {
    blocTest<SeriesBloc, SeriesState>(
      'emits [LoadingSeriesState, LoadedSeriesSuccessState] when LoadingSeriesSuccessEvent is added and getPopularSeriesUseCase returns series',
      build: () {
        when(() => seriesRepositoryMock.getPopularSeries())
            .thenAnswer((_) async => mockSeries);
        return seriesBloc;
      },
      act: (bloc) => bloc.add(LoadingSeriesSuccessEvent()),
      expect: () => [
        LoadingSeriesState(),
        LoadedSeriesSuccessState(mockSeries),
      ],
      verify: (_) {
        verify(() => seriesRepositoryMock.getPopularSeries()).called(1);
      },
    );

    blocTest<SeriesBloc, SeriesState>(
      'emits [LoadingSeriesState, ErrorSeriesState] when LoadingSeriesSuccessEvent is added and getPopularSeriesUseCase throws NetworkSeriesErrorEvent',
      build: () {
        when(() => seriesRepositoryMock.getPopularSeries())
            .thenThrow(NetworkSeriesErrorEvent());
        return seriesBloc;
      },
      act: (bloc) => bloc.add(LoadingSeriesSuccessEvent()),
      expect: () => [
        LoadingSeriesState(),
        const ErrorSeriesState(error: AppStrings.errorMessageSeries),
      ],
      verify: (_) {
        verify(() => seriesRepositoryMock.getPopularSeries()).called(1);
      },
    );
  });
}
