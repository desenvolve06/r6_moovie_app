import 'package:r6_moovie_app/data/api/movie_service_api.dart';
import 'package:r6_moovie_app/data/source/movie_data_source.dart';

import '../../domain/entities/movies.dart';

class MovieDataSourceImpl extends MoviesDataSource {
  final MovieServiceApi _movieServiceApi;

  MovieDataSourceImpl(this._movieServiceApi);

  @override
  Future<List<Movies>> getPopularMovies() async {
   final response = await _movieServiceApi.getPopular();
   return response.results.map((moviesModels) => moviesModels.toEntity()).toList();
  }
}
