import '../../models/movies_model.dart';
import '../popular_movies_mock/popular_movies_data.dart';

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