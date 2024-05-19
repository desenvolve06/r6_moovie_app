import 'package:r6_moovie_app/data/models/series_model.dart';

abstract class SeriesRepository {
  Future<List<SeriesModels>> getPopularSeries();
}
