import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/usecase/add_series_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/get_series_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/is_series_favorite_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../../domain/usecase/remove_series_from_favorite_use_case.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddSeriesToFavoritesUseCase addToFavoritesUseCase;
  final RemoveSeriesFromFavoriteUseCase removeFromFavoritesUseCase;
  final IsSeriesFavoriteUseCase isFavoriteUseCase;
  final GetSeriesFavoritesUseCase getFavoritesUseCase;

  FavoriteBloc(
    this.addToFavoritesUseCase,
    this.removeFromFavoritesUseCase,
    this.isFavoriteUseCase,
    this.getFavoritesUseCase,
  ) : super(FavoriteInitialState()) {
    on<AddSeriesToFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await addToFavoritesUseCase.addToFavoritesList(event.serieId);
        emit(FavoriteAddedState());
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<RemoveSeriesFromFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await removeFromFavoritesUseCase.removeFromFavorite(event.serieId);
        emit(FavoriteRemovedState());
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<CheckSeriesIfFavoriteEvent>((event, emit) async {
      try {
        final isFavorite = await isFavoriteUseCase.isFavorite(event.serieId);
        emit(FavoriteCheckState(isFavorite));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<GetFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final favoriteSeriesIds = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedState(favoriteSeriesIds));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<ToggleSeriesFavorite>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final isFavorite = await isFavoriteUseCase.isFavorite(event.serieId);
        if (isFavorite) {
          await removeFromFavoritesUseCase.removeFromFavorite(event.serieId);
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.serieId);
        }
        final favoriteSeriesIds = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedState(favoriteSeriesIds));
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });
  }
}
