import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/usecase/movies/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/movies/is_favorite_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../../domain/usecase/movies/remove_from_favorite_use_case.dart';
import '../../../domain/usecase/series/add_to_favorites_use_case.dart';
import '../../../domain/usecase/series/get_favorites_use_case.dart';
import '../../../domain/usecase/series/is_favorite_use_case.dart';
import '../../../domain/usecase/series/remove_from_favorite_use_case.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoriteUseCase removeFromFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddToFavoritesSeriesUseCase addToFavoritesSeriesUseCase;
  final RemoveFromFavoriteSeriesUseCase removeFromFavoriteSeriesUseCase;
  final IsFavoriteSeriesUseCase isFavoriteSeriesUseCase;
  final GetFavoritesSeriesUseCase getFavoritesSeriesUseCase;

  FavoriteBloc(
    this.addToFavoritesUseCase,
    this.removeFromFavoritesUseCase,
    this.isFavoriteUseCase,
    this.getFavoritesUseCase,
    this.addToFavoritesSeriesUseCase,
    this.removeFromFavoriteSeriesUseCase,
    this.isFavoriteSeriesUseCase,
    this.getFavoritesSeriesUseCase,
  ) : super(FavoritesInitialState()) {
    on<AddToFavoritesEvent>(_mapAddToFavoritesEventToState);
    on<RemoveFromFavoritesEvent>(_mapRemoveFromFavoritesEventToState);
    on<CheckIfFavoriteEvent>(_mapCheckIfFavoriteEventToState);
    on<GetFavoritesEvent>(_mapGetFavoritesEventToState);
    on<ToggleFavoriteEvent>(_mapToggleFavoriteEventToState);
  }

  void _mapAddToFavoritesEventToState(
      AddToFavoritesEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        await addToFavoritesUseCase.addToFavoritesList(event.media);
        if (kDebugMode) {
          print('Added movie to favorites: ${event.media.originalTitle}');
        }
      } else if (event.media is Series) {
        await addToFavoritesSeriesUseCase.addToFavoritesList(event.media);
        if (kDebugMode) {
          print('Added series to favorites: ${event.media.name}');
        }
      }

      // Obtém a lista atualizada de filmes e séries favoritos
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();

      // Log das listas de favoritos
      if (kDebugMode) {
        print(
            'Favorite movies: ${favoriteMovies.map((movie) => movie.originalTitle).toList()}');
        print(
            'Favorite series: ${favoriteSeries.map((series) => series.name).toList()}');
      }
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));

      if (kDebugMode) {
        print(
            'Favorites loaded: Movies - ${favoriteMovies.map((movie) => movie.originalTitle).toList()}, Series - ${favoriteSeries.map((series) => series.name).toList()}');
      }
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
      if (kDebugMode) {
        print('Error adding to favorites: $e');
      }
    }
  }

  void _mapRemoveFromFavoritesEventToState(
      RemoveFromFavoritesEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        await removeFromFavoritesUseCase.removeFromFavorite(event.media);
        if (kDebugMode) {
          print('Remove movie to favorites: ${event.media}');
        }
      } else if (event.media is Series) {
        await removeFromFavoriteSeriesUseCase.removeFromFavorite(event.media);
        if (kDebugMode) {
          print('Remove series to favorites: ${event.media}');
        }
      }
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
      print('Error Remove to favorites: $e');
    }
  }

  void _mapCheckIfFavoriteEventToState(
      CheckIfFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      bool isFavorite = false;
      if (event.media is Movie) {
        isFavorite = await isFavoriteUseCase.isFavorite(event.media.id);
      } else if (event.media is Series) {
        isFavorite = await isFavoriteSeriesUseCase.isFavorite(event.media.id);
      }
      emit(FavoriteCheckState(isFavorite));
    } catch (e) {
      emit(FavoriteErrorState(AppStrings.errorMessage));
    }
  }

  void _mapGetFavoritesEventToState(
      GetFavoritesEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
    } catch (e) {
      emit(FavoriteErrorState(AppStrings.errorMessage));
    }
  }

  void _mapToggleFavoriteEventToState(
      ToggleFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      bool isFavorite = false;
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        isFavorite = await isFavoriteUseCase.isFavorite(event.media.id);

        if (isFavorite) {
          await removeFromFavoritesUseCase.removeFromFavorite(event.media);
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.media);
        }
      } else if (event.media is Series) {
        isFavorite = await isFavoriteSeriesUseCase.isFavorite(event.media.id);
        if (isFavorite) {
          await removeFromFavoriteSeriesUseCase.removeFromFavorite(event.media);
        } else {
          await addToFavoritesSeriesUseCase.addToFavoritesList(event.media);
        }
      }
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
    } catch (e) {
      emit(FavoriteErrorState(AppStrings.errorMessage));
    }
  }
}
