import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/domain/usecase/movies/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_event.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';

class FavoriteBlocMock extends MockBloc<FavoriteEvent, FavoriteState>
    implements FavoriteBloc {}

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
