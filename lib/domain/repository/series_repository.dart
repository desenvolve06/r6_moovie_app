import 'package:r6_moovie_app/models/series_model.dart';

abstract class SeriesRepository {
  Future<List<SeriesModels>> getPopularSeries();
}
