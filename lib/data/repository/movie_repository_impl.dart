import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../network/source/local/movies/local_data_source.dart';
import '../network/source/remote/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource moviesDataSource;
  final LocalDataSource localDataSource;

  MoviesRepositoryImpl(this.moviesDataSource, this.localDataSource);

  @override
  Future<List<Movie>> getPopularMovies() => moviesDataSource.getPopularMovies();

  @override
  Future<void> addToFavorites(Movie movie) async {
    await localDataSource.addToFavorites(movie);
  }

  @override
  Future<List<Movie>> getFavorites() async {
    return await localDataSource.getFavorites();
  }

  @override
  Future<bool> isFavorite(int id) async {
    return await localDataSource.isFavorite(id);
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    localDataSource.removeFromFavorites(movie);
  }
}
