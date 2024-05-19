import 'package:r6_moovie_app/data/service/series/series_service_api.dart';
import 'package:r6_moovie_app/data/source/series_data_source.dart';
import '../../domain/entities/series.dart';
class SeriesDataSourceImpl extends SeriesDatasource {
  final SeriesServiceApi _seriesServiceApi;

  SeriesDataSourceImpl(this._seriesServiceApi);

  @override
  Future<List<Series>> getPopularMSeries() async {
    final response = await _seriesServiceApi.getSeriesPopular();
    return response.results.map((seriesModels) => seriesModels.toEntity()).toList();

  }
}