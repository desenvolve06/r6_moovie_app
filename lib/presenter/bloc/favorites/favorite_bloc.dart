import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/usecase/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/is_favorite_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../../../domain/usecase/remove_from_favorite_use_case.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoriteUseCase removeFromFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoriteBloc(
    this.addToFavoritesUseCase,
    this.removeFromFavoritesUseCase,
    this.isFavoriteUseCase,
    this.getFavoritesUseCase,
  ) : super(FavoriteInitialState()) {
    on<AddToFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await addToFavoritesUseCase.addToFavoritesList(event.movieId);
        emit(FavoriteAddedState());
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<RemoveFromFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        await removeFromFavoritesUseCase.removeFromFavorite(event.movieId);
        emit(FavoriteRemovedState());
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });

    on<CheckIfFavoriteEvent>((event, emit) async {
      try {
        final isFavorite = await isFavoriteUseCase.isFavorite(event.movieId);
        emit(FavoriteCheckState(isFavorite));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<GetFavoritesEvent>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final favoriteMovieIds = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedState(favoriteMovieIds));
      } catch (e) {
        emit(FavoriteErrorState(AppStrings.errorMessage));
      }
    });

    on<ToggleFavorite>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final isFavorite = await isFavoriteUseCase.isFavorite(event.movieId);
        if (isFavorite) {
          await removeFromFavoritesUseCase.removeFromFavorite(event.movieId);
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.movieId);
        }
        final favoriteMovieIds = await getFavoritesUseCase.getFavorites();
        emit(FavoritesLoadedState(favoriteMovieIds));
      } catch (e) {
        emit(FavoriteErrorState(e.toString()));
      }
    });
  }
}
