import '../../domain/entities/movies.dart';
import '../../domain/repositories/movie_repository.dart';
import '../source/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MoviesRepositoryImpl(this.moviesDataSource);
  @override
  Future<List<Movies>> getPopularMovies() {
    return moviesDataSource.getPopularMovies();
  }
}
