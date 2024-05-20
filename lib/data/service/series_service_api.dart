import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/series_response.dart';
part 'series_service_api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class SeriesServiceApi {
  factory SeriesServiceApi(Dio dio, {String baseUrl}) = _SeriesServiceApi;

  @GET('/tv/popular')
  Future<SeriesResponse> getSeriesPopular();
}