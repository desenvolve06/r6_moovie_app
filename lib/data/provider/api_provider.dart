import 'package:r6_moovie_app/data/popular_series_mock/popular_series_dart.dart';
import 'package:r6_moovie_app/models/series_model.dart';

import '../../models/movies_model.dart';
import '../popular_movies_mock/popular_movies_data.dart';

class ApiProvider {
  final PopularMoviesData _movieData = PopularMoviesData();

  Future<List<MoviesModels>> fetchMovies() async {
    try {
      dynamic movies = _movieData.getMovies();
      return movies;
    } catch (error) {
      rethrow;
    }
  }

  final PopularSeriesData _seriesData = PopularSeriesData();

  Future<List<SeriesModels>> fetchSeries() async {
    try {
      dynamic series = _seriesData.getSeries();
      return series;
    } catch (e) {
      rethrow;
    }
  }
}
