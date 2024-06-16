import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_event.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';

import '../../../stubs/stub.dart';
import '../../../utils/class_mock.dart';

class FakeMovie extends Fake implements Movie {}

class FakeSeries extends Fake implements Series {}

void main() {
  late FavoriteBloc favoriteBloc;
  late MockAddToFavoritesUseCase mockAddToFavoritesUseCase;
  late MockRemoveFromFavoriteUseCase mockRemoveFromFavoritesUseCase;
  late MockIsFavoriteUseCase mockIsFavoriteUseCase;
  late MockGetFavoritesUseCase mockGetFavoritesUseCase;
  late MockAddToFavoritesSeriesUseCase mockAddToFavoritesSeriesUseCase;
  late MockRemoveFromFavoriteSeriesUseCase mockRemoveFromFavoriteSeriesUseCase;
  late MockIsFavoriteSeriesUseCase mockIsFavoriteSeriesUseCase;
  late MockGetFavoritesSeriesUseCase mockGetFavoritesSeriesUseCase;

  final movie = moviesMock;

  final series = seriesMock;

  setUpAll(() {
    registerFallbackValue(FakeMovie());
    registerFallbackValue(FakeSeries());
  });

  setUp(() {
    mockAddToFavoritesUseCase = MockAddToFavoritesUseCase();
    mockRemoveFromFavoritesUseCase = MockRemoveFromFavoriteUseCase();
    mockIsFavoriteUseCase = MockIsFavoriteUseCase();
    mockGetFavoritesUseCase = MockGetFavoritesUseCase();
    mockAddToFavoritesSeriesUseCase = MockAddToFavoritesSeriesUseCase();
    mockRemoveFromFavoriteSeriesUseCase = MockRemoveFromFavoriteSeriesUseCase();
    mockIsFavoriteSeriesUseCase = MockIsFavoriteSeriesUseCase();
    mockGetFavoritesSeriesUseCase = MockGetFavoritesSeriesUseCase();

    favoriteBloc = FavoriteBloc(
      mockAddToFavoritesUseCase,
      mockRemoveFromFavoritesUseCase,
      mockIsFavoriteUseCase,
      mockGetFavoritesUseCase,
      mockAddToFavoritesSeriesUseCase,
      mockRemoveFromFavoriteSeriesUseCase,
      mockIsFavoriteSeriesUseCase,
      mockGetFavoritesSeriesUseCase,
    );
  });

  tearDown(() {
    favoriteBloc.close();
  });

  test('initial state is FavoritesInitialState', () {
    expect(favoriteBloc.state, equals(FavoritesInitialState()));
  });

  group('AddToFavoritesEvent', () {
    blocTest<FavoriteBloc, FavoriteState>(
      'emits [FavoriteLoadingState, FavoritesLoadedState] when successful',
      build: () {
        when(() => mockAddToFavoritesUseCase.addToFavoritesList(any()))
            .thenAnswer((_) async {});
        when(() => mockGetFavoritesUseCase.getFavorites())
            .thenAnswer((_) async => [movie]);
        when(() => mockGetFavoritesSeriesUseCase.getFavorites())
            .thenAnswer((_) async => [series]);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(AddToFavoritesEvent(movie)),
      expect: () => [
        FavoriteLoadingState(),
        FavoritesLoadedState([movie], [series]),
      ],
      verify: (_) {
        verify(() => mockAddToFavoritesUseCase.addToFavoritesList(movie))
            .called(1);
        verify(() => mockGetFavoritesUseCase.getFavorites()).called(1);
        verify(() => mockGetFavoritesSeriesUseCase.getFavorites()).called(1);
      },
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'emits [FavoriteLoadingState, FavoriteErrorState] when unsuccessful',
      build: () {
        when(() => mockAddToFavoritesUseCase.addToFavoritesList(any()))
            .thenThrow(Exception('Failed to add favorite'));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(AddToFavoritesEvent(movie)),
      expect: () => [
        FavoriteLoadingState(),
        const FavoriteErrorState('Exception: Failed to add favorite'),
      ],
    );
  });
}
