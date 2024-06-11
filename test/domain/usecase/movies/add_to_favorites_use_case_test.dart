import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/add_to_favorites_use_case.dart';

import '../../../stubs/stub.dart';
import '../../../utils/class_mock.dart';

void main() {
  late MoviesRepository moviesRepository;
  late AddToFavoritesUseCase addToFavoritesUseCase;

  final movie = moviesMock;

  setUpAll(() {
    moviesRepository = MoviesRepositoryMock();
    addToFavoritesUseCase = AddToFavoritesUseCase(moviesRepository);
  });

  group('AddToFavoriteUseCase:', () {
    test('Should add a movie in favorites', () async {
      
      when(() => moviesRepository.addToFavorites(movie)).thenAnswer((_) => Future.value(),);

      await addToFavoritesUseCase.addToFavoritesList(movie);

      verify(() => moviesRepository.addToFavorites(movie)).called(1);
    });
  });
}
