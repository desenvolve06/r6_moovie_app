import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/series.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteAddedState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteRemovedState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteCheckState extends FavoriteState {
  final bool isFavorite;

  const FavoriteCheckState(this.isFavorite);
}

class FavoritesInitialState extends FavoriteState {}

class FavoritesLoadedState extends FavoriteState {
  final List<Movie> favoriteMovies;
  final List<Series> favoriteSeries;

  const FavoritesLoadedState(this.favoriteMovies, this.favoriteSeries);

  @override
  List<Object?> get props => [favoriteMovies, favoriteSeries];
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  const FavoriteErrorState(this.message);

  @override
  List<Object> get props => [message];
}
