import 'package:r6_moovie_app/data/popular_movies_mock/popular_movies_data.dart';

import 'models/movies_model.dart';

class ApiProvider {

  final PopularMoviesData _movieData = PopularMoviesData();

  Future<List<MoviesModels>> fetchMovies() async {
    try {
      dynamic movies = _movieData.getMovies();
      return movies;
    } catch(error) {
      rethrow;
    }
  }
}