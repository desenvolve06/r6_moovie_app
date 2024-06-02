import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../network/source/local/movies/local_data_source_movies.dart';
import '../network/source/remote/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource moviesDataSource;
  final LocalDataSourceMovies localDataSourceMovies;

  MoviesRepositoryImpl(this.moviesDataSource, this.localDataSourceMovies);

  @override
  Future<List<Movie>> getPopularMovies() => moviesDataSource.getPopularMovies();

  @override
  Future<void> addToFavorites(Movie movie) async {
    await localDataSourceMovies.addToFavorites(movie);
  }

  @override
  Future<List<Movie>> getFavorites() async {
    return await localDataSourceMovies.getFavorites();
  }

  @override
  Future<bool> isFavorite(int id) async {
    return await localDataSourceMovies.isFavorite(id);
  }

  @override
  Future<void> removeFromFavorites(Movie movie) async {
    localDataSourceMovies.removeFromFavorites(movie);
  }
}
