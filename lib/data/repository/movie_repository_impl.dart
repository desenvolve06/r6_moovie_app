import 'package:logger/logger.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../network/source/local/movies/local_data_source_movies.dart';
import '../network/source/remote/movie_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieDataSource moviesDataSource;
  final LocalDataSourceMovies localDataSourceMovies;
  final Logger logger = Logger();

  MoviesRepositoryImpl(this.moviesDataSource, this.localDataSourceMovies);

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final movies = await localDataSourceMovies.getPopularMovies();
      if (movies.isEmpty) {
        // Se não houver filmes localmente, pegue os filmes da fonte remota
        final remoteMovies = await moviesDataSource.getPopularMovies();
        await saveMovies(remoteMovies);
        logger.i('Movies retrieved from repository: ${remoteMovies}');
        return remoteMovies;
      } else {
        logger.i('Movies retrieved from repository : ${movies}');
        return movies;
      }
    } catch (e) {
      logger.e('Failed to fetch movies: $e');
      return [];
    }
  }

  @override
  Future<void> saveMovies(List<Movie> movies) async {
    localDataSourceMovies.saveMovies(movies);
  }


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
