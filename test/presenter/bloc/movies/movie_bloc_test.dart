import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/movies/movie_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/movies/movie_event.dart';
import 'package:r6_moovie_app/presenter/bloc/movies/movie_state.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_popular_movie_use_case.dart';

import '../../../utils/class_mock.dart';
import '../../bloc/movies/movies_bloc_test.mock.dart';

void main() {
  late MoviesRepositoryMock moviesRepositoryMock;
  late GetPopularMoviesUseCase getPopularMoviesUseCase;
  late MovieBloc movieBloc;

  setUp(() {
    moviesRepositoryMock = MoviesRepositoryMock();
    getPopularMoviesUseCase = GetPopularMoviesUseCase(moviesRepositoryMock);
    movieBloc = MovieBloc(getPopularMoviesUseCase);
  });

  group('MovieBloc', () {
    blocTest<MovieBloc, MovieState>(
      'emits [LoadingState, LoadedSuccessState] when LoadingSuccessEvent is added and getPopularMoviesUseCase returns movies',
      build: () {
        when(() => moviesRepositoryMock.getPopularMovies())
            .thenAnswer((_) async => mockMovies);
        return movieBloc;
      },
      act: (bloc) => bloc.add(LoadingSuccessEvent()),
      expect: () => [
        LoadingState(),
        LoadedSuccessState(movies: mockMovies),
      ],
      verify: (_) {
        verify(() => moviesRepositoryMock.getPopularMovies()).called(1);
      },
    );

    blocTest<MovieBloc, MovieState>(
      'emits [LoadingState, ErrorState] when LoadingSuccessEvent is added and getPopularMoviesUseCase throws NetworkErrorEvent',
      build: () {
        when(() => moviesRepositoryMock.getPopularMovies())
            .thenThrow(NetworkErrorEvent());
        return movieBloc;
      },
      act: (bloc) => bloc.add(LoadingSuccessEvent()),
      expect: () => [
        LoadingState(),
        const ErrorState(error: "Failure to get movies. Is your device online?"),
      ],
      verify: (_) {
        verify(() => moviesRepositoryMock.getPopularMovies()).called(1);
      },
    );
  });
}
