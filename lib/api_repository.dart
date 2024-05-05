import 'package:r6_moovie_app/data/popular_movies_mock/popular_movies_data.dart';
import 'package:r6_moovie_app/models/movies_model.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_bloc.dart';
import 'package:r6_moovie_app/presentation/bloc/movie_event.dart';

import 'api_provider.dart';
import 'data/repository/movie_repository_impl.dart';
import 'domain/repository/movie_repository.dart';

class ApiRepository  {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<MoviesModels>> fetchMovies() {
    return _apiProvider.fetchMovies();
  }
}
  class NetworkError extends Error{}

