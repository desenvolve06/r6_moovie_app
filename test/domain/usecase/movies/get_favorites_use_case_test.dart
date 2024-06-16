import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_favorites_use_case.dart';

import '../../../stubs/stub.dart';
import '../../../utils/class_mock.dart';

void main() {
  late MoviesRepository moviesRepository;
  late GetFavoritesUseCase getFavoritesUseCase;

  final movie = moviesMock;

  setUpAll(() {
    moviesRepository = MoviesRepositoryMock();
    getFavoritesUseCase = GetFavoritesUseCase(
      moviesRepository,
    );
  });

  group('GetFavoritesUseCase', () {
    test('Should return a list of movie', () async {
      when(() => moviesRepository.getFavorites()).thenAnswer((_) => Future.value([movie]));

      final result = await getFavoritesUseCase.getFavorites();

      expect(result, [movie]);
    });
  });
}
