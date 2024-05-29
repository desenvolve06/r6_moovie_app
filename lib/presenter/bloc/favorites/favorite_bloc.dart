import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/domain/entities/movie.dart';
import 'package:r6_moovie_app/domain/entities/series.dart';
import 'package:r6_moovie_app/domain/usecase/add_to_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/get_favorites_use_case.dart';
import 'package:r6_moovie_app/domain/usecase/is_favorite_use_case.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import '../../../domain/usecase/remove_from_favorite_use_case.dart';
import '../../../domain/usecase/series/add_to_favorites_series_use_case.dart';
import '../../../domain/usecase/series/get_favorites_series_use_case.dart';
import '../../../domain/usecase/series/is_favorite_series_use_case.dart';
import '../../../domain/usecase/series/remove_from_favorite_series_use_case.dart';
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

  void _mapAddToFavoritesEventToState(AddToFavoritesEvent event,
      Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        await addToFavoritesUseCase.addToFavoritesList(event.media);
        if (kDebugMode) {
          print('${event.media}');
        }
      } else if (event.media is Series) {
        await addToFavoritesSeriesUseCase.addToFavoritesList(event.media);
        if (kDebugMode) {
          print('${event.media}');
        }
      }
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
      if (kDebugMode) {
        print('$favoriteMovies');
      }
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));

    }
    if (kDebugMode) {
      print('${event.media}');
    }
  }


  void _mapRemoveFromFavoritesEventToState(RemoveFromFavoritesEvent event,
      Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        await removeFromFavoritesUseCase.removeFromFavorite(event.media.id);
      } else if (event.media is Series) {
        await removeFromFavoriteSeriesUseCase.removeFromFavorite(event.media.id);
      }
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }

  void _mapCheckIfFavoriteEventToState(CheckIfFavoriteEvent event,
      Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      bool isFavorite = false;
      if (event.media is Movie) {
        isFavorite = await isFavoriteUseCase.isFavorite(event.media.id);
        print(' checkIs favorite movie: ${event.media}');
        print(' mapCheckIfFavoriteEventToStat ${event.media.id}');
      } else if (event.media is Series) {
        isFavorite = await isFavoriteSeriesUseCase.isFavorite(event.media.id);
        print(' checkIs favorite series: ${event.media}');
        print(' mapCheckIfFavoriteEventToStat ${event.media.id}');
      }
      emit(FavoriteCheckState(isFavorite));
    } catch (e) {
      emit( FavoriteErrorState(AppStrings.errorMessage));
    }
  }


  void _mapGetFavoritesEventToState(GetFavoritesEvent event,
      Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteLoadingState());
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
      print(' mapgetFavorites Event: $favoriteMovies,$favoriteSeries');

    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }

  void _mapToggleFavoriteEventToState(ToggleFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      bool isFavorite = false;
      emit(FavoriteLoadingState());
      if (event.media is Movie) {
        isFavorite = await isFavoriteUseCase.isFavorite(event.media.id);
        print(' toogle Favorite movie: ${event.media.id}');

        if (isFavorite) {
          await removeFromFavoritesUseCase.removeFromFavorite(event.media);
          print(' toogle re move Favorite movie: ${event.media}');
        } else {
          await addToFavoritesUseCase.addToFavoritesList(event.media);
          print(' toogle add Favorite movie: ${event.media}');
        }
      } else if (event.media is Series) {
        isFavorite = await isFavoriteSeriesUseCase.isFavorite(event.media.id);
        if (isFavorite) {
          await removeFromFavoriteSeriesUseCase.removeFromFavorite(event.media);
          print(' toogle add Favorite series: ${event.media}');
        } else {
          await addToFavoritesSeriesUseCase.addToFavoritesList(event.media);
          print(' toogle add Favorite series: ${event.media}');
        }
      }
      final favoriteMovies = await getFavoritesUseCase.getFavorites();
      final favoriteSeries = await getFavoritesSeriesUseCase.getFavorites();
      emit(FavoritesLoadedState(favoriteMovies, favoriteSeries));
      print(' toogle FavoritesLoadedStates: $favoriteMovies, $favoriteSeries');
    } catch (e) {
      emit(FavoriteErrorState(AppStrings.errorMessage));
    }
  }
}
