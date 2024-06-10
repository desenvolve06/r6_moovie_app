import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/data/network/source/local/movies/local_data_source_movies.dart';
import 'package:r6_moovie_app/data/network/source/local/series/local_data_source_series.dart';
import 'package:r6_moovie_app/data/network/source/remote/movie_data_source.dart';
import 'package:r6_moovie_app/data/network/source/remote/series_data_source.dart';
import 'package:r6_moovie_app/domain/repository/movie_repository.dart';
import 'package:r6_moovie_app/domain/repository/series_repository.dart';
import 'package:r6_moovie_app/domain/usecase/movies/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

class MockSeriesDatasource extends Mock implements SeriesDatasource {}

class MockLocalDataSourceSeries extends Mock implements LocalDataSourceSeries {}

class MockMovieDataSource extends Mock implements MovieDataSource {}

class MockLocalDataSourceMovies extends Mock implements LocalDataSourceMovies {}

class SeriesRepositoryMock extends Mock implements SeriesRepository {}

//favoritos
class MockAddToFavoritesUseCase extends Mock implements AddToFavoritesUseCase {}

class MockRemoveFromFavoriteUseCase extends Mock
    implements RemoveFromFavoriteUseCase {}

class MockIsFavoriteUseCase extends Mock implements IsFavoriteUseCase {}

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockAddToFavoritesSeriesUseCase extends Mock
    implements AddToFavoritesSeriesUseCase {}

class MockRemoveFromFavoriteSeriesUseCase extends Mock
    implements RemoveFromFavoriteSeriesUseCase {}

class MockIsFavoriteSeriesUseCase extends Mock
    implements IsFavoriteSeriesUseCase {}

class MockGetFavoritesSeriesUseCase extends Mock
    implements GetFavoritesSeriesUseCase {}
