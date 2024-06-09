import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/is_favorite_use_case.dart';

import '../../../utils/class_mock.dart';

void main() {
  late MoviesRepository moviesRepository;
  late IsFavoriteUseCase isFavoriteUseCase;
  const movieId = 123;

  setUpAll(() {
    moviesRepository = MoviesRepositoryMock();
    isFavoriteUseCase = IsFavoriteUseCase(moviesRepository);

  });
  group('IsFavoriteUseCase', () {
    test('Should return true when movie is favorite', () async {
      
      when(() => moviesRepository.isFavorite(movieId)).thenAnswer((_) => Future.value(true));
      
      final result = await isFavoriteUseCase.isFavorite(movieId);
      
      expect(result, true);
    });
  });
}
