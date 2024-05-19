import '../../domain/entities/movie.dart';
import '../service/movie_service_api.dart';
import 'movie_data_source.dart';
class MovieDataSourceImpl extends MovieDataSource {
 final MovieServiceApi _movieServiceApi;

 MovieDataSourceImpl(this._movieServiceApi);

 @override
 Future<List<Movie>> getPopularMovies() async {
  final response = await _movieServiceApi.getPopular();
  return response.results.map((moviesModels) => moviesModels.toEntity()).toList();
 }
}