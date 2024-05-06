import 'package:r6_moovie_app/data/popular_movies_mock/popular_movies_data.dart';
import '../models/movies_model.dart';
import '../domain/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final PopularMoviesData _popularMoviesData;

  MoviesRepositoryImpl({required PopularMoviesData popularMoviesData})
      : _popularMoviesData = popularMoviesData;

  @override
  Future<MoviesModels> getPopularMovies() async {
    try {
      dynamic movies = _popularMoviesData.getMovies();
      return movies = MoviesModels.fromJson(movies);
    } catch (error) {
      rethrow;
    }
  }
}

