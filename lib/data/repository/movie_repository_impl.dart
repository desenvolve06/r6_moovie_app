import 'package:dio/dio.dart';

import '../../models/movies_model.dart';
import '../popular_movies_mock/popular_movies_data.dart';
import '../../domain/repository/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final PopularMoviesData _moviesData;

  MoviesRepositoryImpl(this._moviesData);

  @override
  Future<List<MoviesModels>> getPopularMovies() async {
    try {
      dynamic movies = _moviesData.getMovies();
      return movies;
    } catch (error) {
      rethrow;
    }
  }
}

