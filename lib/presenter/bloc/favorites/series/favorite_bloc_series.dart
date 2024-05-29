import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/series/favorite_event_series.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'favorite_state_series.dart';

class FavoriteBlocSeries extends Bloc<FavoriteEventSeries, FavoriteStateSeries> {
  final AddToFavoritesSeriesUseCase addToFavoritesUseCase;
  final RemoveFromFavoriteSeriesUseCase removeFromFavoriteUseCase;
  final IsFavoriteSeriesUseCase isFavoriteUseCase;
  final GetFavoritesSeriesUseCase getFavoritesUseCase;

  FavoriteBlocSeries(
      this.addToFavoritesUseCase,
      this.removeFromFavoriteUseCase,
      this.isFavoriteUseCase,
      this.getFavoritesUseCase,
      ) : super(FavoriteInitialStateSeries()) {
    on<AddToFavoritesEventSeries>((event, emit) async {
      try {
        emit(FavoriteLoadingStateSeries());
        await addToFavoritesUseCase.addToFavoritesList(event.series);
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorStateSeries(AppStrings.errorMessage));
      }
    });

    on<RemoveFromFavoritesEventSeries>((event, emit) async {
      try {
        emit(FavoriteLoadingStateSeries());
        await removeFromFavoriteUseCase.removeFromFavorite(event.seriesId);
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorStateSeries(AppStrings.errorMessage));
      }
    });

    on<CheckIfFavoriteEventSeries>((event, emit) async {
      try {
        final isFavorite = await isFavoriteUseCase.isFavorite(event.seriesId);
        emit(FavoriteCheckStateSeries(isFavorite));
      } catch (e) {
        emit(FavoriteErrorStateSeries(AppStrings.errorMessage));
      }
    });

    on<GetFavoritesEventSeries>((event, emit) async {
      try {
        emit(FavoriteLoadingStateSeries());
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorStateSeries(AppStrings.errorMessage));
      }
    });

    on<ToggleFavoriteEventSeries>((event, emit) async {
      try {
        emit(FavoriteLoadingStateSeries());
        final isFavorite = await isFavoriteUseCase.isFavorite(event.series.id);
        if (isFavorite) {
          await removeFromFavoriteUseCase.removeFromFavorite(event.series);
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.series);
        }
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorStateSeries(e.toString()));
      }
    });
  }
}
