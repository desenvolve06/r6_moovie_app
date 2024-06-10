import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/movies/local_data_source_movies.dart';
import 'package:r6_moovie_app/data/network/source/remote/movie_data_source.dart';
import 'package:r6_moovie_app/data/repository/movie_repository_impl.dart';

import '../../stubs/stub.dart';
import '../../utils/class_mock.dart';

void main() {
  group('MoviesRepositoryImpl', () {
    late MoviesRepositoryImpl moviesRepository;
    late MovieDataSource movieDataSource;
    late LocalDataSourceMovies localDataSourceMovies;

    final movie = moviesMock;

    setUp(() {
      movieDataSource = MockMovieDataSource();
      localDataSourceMovies = MockLocalDataSourceMovies();
      moviesRepository = MoviesRepositoryImpl(
        movieDataSource,
        localDataSourceMovies,
      );
    });

    test('getPopularMovies should return a list of movies', () async {
      when(() => movieDataSource.getPopularMovies())
          .thenAnswer((_) async => Future.value([movie]));

      final result = await moviesRepository.getPopularMovies();

      expect(result, [movie]);
    });

    test('addToFavorites should add a movie to favorites', () async {
      when(() => localDataSourceMovies.addToFavorites(movie)).thenAnswer(
        (_) async => Future.value(),
      );

      await moviesRepository.addToFavorites(movie);

      verify(() => localDataSourceMovies.addToFavorites(movie)).called(1);
    });

    test('getFavorites should return a list of movies', () async {
      when(() => localDataSourceMovies.getFavorites())
          .thenAnswer((_) async => Future.value([movie]));

      final result = await moviesRepository.getFavorites();

      expect(result, [movie]);
    });

    test('isFavorite should return true if the movie is in favorites', () async {
      when(() => localDataSourceMovies.isFavorite(1))
          .thenAnswer((_) async => Future.value(true));

      final result = await moviesRepository.isFavorite(1);

      expect(result, true);
    });

    test('removeFromFavorites should remove a movie from favorites', () async{
      when(() => localDataSourceMovies.removeFromFavorites(movie)).thenAnswer(
        (_) async => Future.value(),
      );

      await moviesRepository.removeFromFavorites(movie);

      verify(() => localDataSourceMovies.removeFromFavorites(movie)).called(1);
    });
  });
}
