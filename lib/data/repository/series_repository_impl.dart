import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/data/models/series_model.dart';

import '../provider/api_provider.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final ApiProvider _apiProvider = ApiProvider();
  @override
  Future<List<SeriesModels>> getPopularSeries() {
    return _apiProvider.fetchSeries();
  }
}
