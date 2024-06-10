import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_popular_movie_use_case.dart';

import '../../../utils/class_mock.dart';

void main() {
  late MoviesRepository moviesRepository;
  late GetPopularMoviesUseCase getPopularMoviesUseCase;

  final movie = Movie(
      adult: true,
      backdropPath: '',
      genreIds: [1, 2],
      id: 1,
      originalLanguage: 'en',
      originalTitle: '',
      overview: '',
      popularity: 2.5,
      posterPath: '',
      releaseDate: '',
      title: '',
      video: true,
      voteAverage: 3.1,
      voteCount: 3);

  setUpAll(() {
    moviesRepository = MoviesRepositoryMock();
    getPopularMoviesUseCase = GetPopularMoviesUseCase(
      moviesRepository,
    );
  });
  group("GetPopularMovieUseCase: ", () {
    test('Should return a list of Movie', () async {
      when(() => moviesRepository.getPopularMovies()).thenAnswer((_) => Future.value([movie]));

      final result = await getPopularMoviesUseCase.invoke();

      expect(result, [movie]);
    });
  });
}