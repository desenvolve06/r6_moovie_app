import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/remove_from_favorite_use_case.dart';

import '../../../utils/class_mock.dart';

void main() {
  group('RemoveFromFavoriteUseCase', () {
    late MoviesRepository moviesRepository;
    late RemoveFromFavoriteUseCase removeFromFavoriteUseCase;
    

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