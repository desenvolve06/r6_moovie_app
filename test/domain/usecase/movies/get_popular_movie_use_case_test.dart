import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_popular_movie_use_case.dart';

import '../../../utils/class_mock.dart';
import '../../../utils/stubs.dart';

void main() {
  late MoviesRepository moviesRepository;
  late GetPopularMoviesUseCase getPopularMoviesUseCase;

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