import '../provider/api_provider.dart';
import '../../models/movies_model.dart';
import '../../domain/repository/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiProvider _apiProvider = ApiProvider();

  @override
  Future<List<MoviesModels>> fetchMovies() {
    return _apiProvider.fetchMovies();
  }
}



