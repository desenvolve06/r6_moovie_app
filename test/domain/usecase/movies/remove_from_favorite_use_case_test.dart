import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/remove_from_favorite_use_case.dart';

import '../../../utils/class_mock.dart';
import '../../../utils/stubs.dart';

void main() {
  group('RemoveFromFavoriteUseCase', () {
    late MoviesRepository moviesRepository;
    late RemoveFromFavoriteUseCase removeFromFavoriteUseCase;

    setUp(() {
      moviesRepository = MoviesRepositoryMock();
      removeFromFavoriteUseCase = RemoveFromFavoriteUseCase(moviesRepository);
    });

    test('should remove movie from favorites', () async {
      
      when(() => moviesRepository.removeFromFavorites(movie)).thenAnswer((_) async => Future.value());

      
      await removeFromFavoriteUseCase.removeFromFavorite(movie);

      verify(() => moviesRepository.removeFromFavorites(movie)).called(1);
    });
  });
}