import 'package:r6_moovie_app/data/popular_movies_mock/popular_movies_data.dart';
import '../../models/movies_model.dart';
import '../../domain/repository/movie_repository.dart';
import '../provider/api_provider.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiProvider _apiProvider = ApiProvider();
  @override
  Future<List<MoviesModels>> getPopularMovies() {
    return _apiProvider.fetchMovies();
  }
}

