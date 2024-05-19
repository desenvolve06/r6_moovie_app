import 'package:r6_moovie_app/data/popular_series_mock/popular_series_dart.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';

class ApiProvider {
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
