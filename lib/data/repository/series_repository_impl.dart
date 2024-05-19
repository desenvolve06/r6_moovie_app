import '../../domain/repositories/series_repository.dart';
import '../models/series_model.dart';
import '../provider/api_provider.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final ApiProvider _apiProvider = ApiProvider();
  @override
  Future<List<SeriesModels>> getPopularSeries() {
    return _apiProvider.fetchSeries();
  }
}
