import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/usecase/series/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/is_favorite_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/series/remove_from_favorite_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBlocSeries extends Bloc<FavoriteEvent, FavoriteStateSeries> {
  final AddToFavoritesSeriesUseCase addToFavoritesUseCase;
  final RemoveFromFavoriteSeriesUseCase removeFromFavoriteUseCase;
  final IsFavoriteSeriesUseCase isFavoriteUseCase;
  final GetFavoritesSeriesUseCase getFavoritesUseCase;

  FavoriteBlocSeries(
      this.addToFavoritesUseCase,
      this.removeFromFavoriteUseCase,
      this.isFavoriteUseCase,
      this.getFavoritesUseCase,
      ) : super(FavoriteInitialState()) {
    on<AddToFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await addToFavoritesUseCase.addToFavoritesList(event.series);
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<RemoveFromFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await removeFromFavoriteUseCase.removeFromFavorite(event.seriesId);
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<CheckIfFavoriteEvent>((event, emit) async {
      try {
        final isFavorite = await isFavoriteUseCase.isFavorite(event.seriesId);
        emit(FavoriteCheckState(isFavorite));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<GetFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<ToggleFavoriteEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final isFavorite = await isFavoriteUseCase.isFavorite(event.series.id);
        if (isFavorite) {
          await removeFromFavoriteUseCase.removeFromFavorite(event.series);
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.series);
        }
        final favoriteSeries = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedStateSeries(favoriteSeries));
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });
  }
}
