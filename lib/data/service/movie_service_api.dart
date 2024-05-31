import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/movies/movies_response.dart';
part 'movie_service_api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieServiceApi {
  factory MovieServiceApi(Dio dio, {String baseUrl}) = _MovieServiceApi;

  @GET('/movie/popular')
  Future<MoviesResponse> getPopular();
}