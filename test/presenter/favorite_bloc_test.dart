import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/usecase/movies/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_event.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';

class MockAddToFavoritesUseCase extends Mock implements AddToFavoritesUseCase {}

class MockRemoveFromFavoriteUseCase extends Mock
    implements RemoveFromFavoriteUseCase {}

class MockIsFavoriteUseCase extends Mock implements IsFavoriteUseCase {}

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockAddToFavoritesSeriesUseCase extends Mock
    implements AddToFavoritesSeriesUseCase {}

class MockRemoveFromFavoriteSeriesUseCase extends Mock
    implements RemoveFromFavoriteSeriesUseCase {}

class MockIsFavoriteSeriesUseCase extends Mock
    implements IsFavoriteSeriesUseCase {}

class MockGetFavoritesSeriesUseCase extends Mock
    implements GetFavoritesSeriesUseCase {}

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

  final movie = Movie(
    adult: false,
    backdropPath: 'path',
    genreIds: [1, 2],
    id: 1,
    originalLanguage: 'en',
    originalTitle: 'Test Movie',
    overview: 'Overview',
    popularity: 10.0,
    posterPath: 'path',
    releaseDate: '2021-01-01',
    title: 'Test Movie',
    video: false,
    voteAverage: 5.0,
    voteCount: 100,
  );

  final series = Series(
    id: 1,
    name: 'Test Series',
    overview: 'Overview',
    firstAirDate: '2021-01-01',
    voteAverage: 5.0,
    posterPath: 'path',
    backdropPath: 'path',
  );

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
