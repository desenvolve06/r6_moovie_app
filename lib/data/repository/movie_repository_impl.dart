import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../source/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource moviesDataSource;

  MoviesRepositoryImpl(this.moviesDataSource);
  @override
  Future<List<Movie>> getPopularMovies() => moviesDataSource.getPopularMovies();
}

